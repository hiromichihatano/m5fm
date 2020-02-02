#include <M5Stack.h>
#include "ym2608_ll.h"
#include <array>

namespace YM2608_LL
{

static const gpio_num_t YM_SPISS = GPIO_NUM_2;
static const gpio_num_t YM_CS = GPIO_NUM_5;
static const gpio_num_t YM_WR = GPIO_NUM_16;
static const gpio_num_t YM_RD = GPIO_NUM_17;
static const gpio_num_t YM_SPKOUT = GPIO_NUM_25;

static const uint32_t YM_SPISS_Active = 0U; // inverted
static const uint32_t YM_SPISS_Inactive = 1U;
static const uint32_t YM_CS_Active = 0U; // inverted
static const uint32_t YM_CS_Inactive = 1U;
static const uint32_t YM_WRRD_Active = 0U; // inverted
static const uint32_t YM_WRRD_Inactive = 1U;

static const int32_t MASTER_CLOCK = (8 * 1000 * 1000);

static SPIClass ymSpi(VSPI);

static inline uint64_t gpioBit(gpio_num_t gpionum) {return 1ULL << static_cast<uint64_t>(gpionum);}


void Setup() {
    static gpio_config_t gpioconf_outputs;
    gpioconf_outputs.pin_bit_mask = gpioBit(YM_SPISS) | gpioBit(YM_CS) | gpioBit(YM_WR) | gpioBit(YM_RD);
    gpioconf_outputs.intr_type = GPIO_INTR_DISABLE;
    gpioconf_outputs.mode = GPIO_MODE_OUTPUT;
    gpioconf_outputs.pull_down_en = GPIO_PULLDOWN_DISABLE;
    gpioconf_outputs.pull_up_en = GPIO_PULLUP_DISABLE;
    gpio_config(&gpioconf_outputs);

    static gpio_config_t gpioconf_inputs;
    gpioconf_inputs.pin_bit_mask = gpioBit(YM_SPKOUT);
    gpioconf_inputs.intr_type = GPIO_INTR_DISABLE;
    gpioconf_inputs.mode = GPIO_MODE_INPUT;
    gpioconf_inputs.pull_down_en = GPIO_PULLDOWN_ENABLE;
    gpioconf_inputs.pull_up_en = GPIO_PULLUP_DISABLE;
    gpio_config(&gpioconf_inputs);

    ymSpi.begin();
    ymSpi.setHwCs(false);
    ymSpi.setBitOrder(MSBFIRST);
    ymSpi.setDataMode(SPI_MODE3);
    uint8_t init[] = {0x00, 0x00};
    ymSpi.writeBytes(init, 2); // Fill 0 before Sets SS Pin Inactive

    gpio_set_level(YM_SPISS, YM_SPISS_Inactive); // CS pin inactive
    gpio_set_level(YM_CS, YM_CS_Inactive); // YM_CS pin inactive
    gpio_set_level(YM_WR, YM_WRRD_Inactive); // YM_WR Pin inactive
    usleep(300*1000);
}

void Write(uint8_t a01, uint8_t data) {
    uint8_t dataAry[] = {data, static_cast<uint8_t>(a01 & 0x03U)};
    Serial.printf("Write 0x%x: 0x%02x\n", a01, data);
    gpio_set_level(YM_SPISS, YM_SPISS_Active);
    ymSpi.writeBytes(dataAry, 2);
    gpio_set_level(YM_SPISS, YM_SPISS_Inactive);
}

void SSG_Write(uint8_t ssgAddr, uint8_t data[], int32_t len) {
    Write(0x00, ssgAddr); // write address
    gpio_set_level(YM_CS, YM_CS_Active);
    gpio_set_level(YM_WR, YM_WRRD_Active);
    usleep(10);
    gpio_set_level(YM_CS, YM_CS_Inactive);
    // No wait cycles on SSG.
    for(int32_t i=0; i<len; i++){
        gpio_set_level(YM_CS, YM_CS_Active);
        Write(0x01, data[i]); // write data
        usleep(10);
        gpio_set_level(YM_CS, YM_CS_Inactive);
    }
    gpio_set_level(YM_WR, YM_WRRD_Inactive);
}

void SSG_Write(uint8_t ssgAddr, uint8_t data) {
    // SSG_Write(ssgAddr, &data, 1);
    Write(0x00, ssgAddr); // write address
    gpio_set_level(YM_CS, YM_CS_Active);
    gpio_set_level(YM_WR, YM_WRRD_Active);
    usleep(10);
    gpio_set_level(YM_CS, YM_CS_Inactive);
    usleep(10);
    Write(0x01, data); // write address
    gpio_set_level(YM_CS, YM_CS_Active);
    usleep(10);
    gpio_set_level(YM_CS, YM_CS_Inactive);
    gpio_set_level(YM_WR, YM_WRRD_Inactive);
}

void SSG_SetToneFreq(int32_t channel, int32_t toneFreq){
    const int32_t paramVal = MASTER_CLOCK / (64 * toneFreq);
    const uint8_t ssgAddrCoarse = static_cast<uint8_t>(channel * 2 + 1);
    const uint8_t ssgAddrFine = static_cast<uint8_t>(channel * 2);
    const uint8_t volCoarse = static_cast<uint8_t>(paramVal / 256);
    const uint8_t volFine = static_cast<uint8_t>(paramVal % 256);

    SSG_Write(ssgAddrCoarse, volCoarse);
    SSG_Write(ssgAddrFine, volFine);
}

/**
 * @brief Set Enables
 * 
 * @param inoutEn b0: chA, b1: chB / 0=input, 1=output
 * @param noiseEn b0-b2: ch1-3 / 0=enable, 1=stop
 * @param toneEn  b0-b2: ch1-3 / 0=enable, 1=stop
 */
void SSG_SetEnable(uint8_t inoutEn, uint8_t noiseEn, uint8_t toneEn) {
    const uint8_t ssgAddr = 0x07;
    const uint8_t value = static_cast<uint8_t>(
        ((inoutEn & 0x03) << 6) | ((noiseEn & 0x07) << 3) | (toneEn & 0x07));
    SSG_Write(ssgAddr, value);
}

/**
 * @brief Set Amptlitudes.
 * 
 * @param channel channel 0-3
 * @param mode 0: controlled by level / 1: controlled by Envelope
 * @param level 0-15, 0=min, 15=max
 */
void SSG_SetAmplitude(int32_t channel, uint8_t mode, uint8_t level) {
    const uint8_t ssgAddr = static_cast<uint8_t>(0x08U + channel);
    const uint8_t paramVal = static_cast<uint8_t>((mode & 0x01U) << 4) | (level & 0x0fU);
    SSG_Write(ssgAddr, paramVal);
}


namespace FM {
    static const useconds_t WaitAfterAddrWrite = 1000 * 1000 * 17 / MASTER_CLOCK + 1;
    static const useconds_t WaitAfterDataWrite1 = 1000 * 1000 * 83 / MASTER_CLOCK + 1; // addr 0x21-0x9e
    static const useconds_t WaitAfterDataWrite2 = 1000 * 1000 * 47 / MASTER_CLOCK + 1; // addr 0xa0-0xb6
    enum class AddrArea { CH1_3, CH4_6};
    enum class Prescaler { FM1p6_SSG1p4, FM1p3_SSG1p2, FM1p2_SSH1p1};
    
    void addrWrite(AddrArea addrArea, uint8_t fmAddr) {
        const uint8_t a01_addr = (addrArea == AddrArea::CH1_3) ? 0x00 : 0x02;

        Write(a01_addr, fmAddr);
        usleep(1); // 10ns a01 set -> YM_CS active
        gpio_set_level(YM_CS, YM_CS_Active);
        gpio_set_level(YM_WR, YM_WRRD_Active);
        usleep(1); // 200ns YM_CS active -> inactive
        gpio_set_level(YM_CS, YM_CS_Inactive);

        usleep(WaitAfterAddrWrite);
    }

    void fmWrite(AddrArea addrArea, uint8_t fmAddr, uint8_t data) {
        const uint8_t a01_data = (addrArea == AddrArea::CH1_3) ? 0x01 : 0x03;
        const uint8_t WaitAfterDataWrite = (fmAddr < 0xa0) ? WaitAfterDataWrite1 : WaitAfterDataWrite2;

        addrWrite(addrArea, fmAddr);

        Write(a01_data, data); // write address
        usleep(1); // 10ns a01 set -> YM_CS active
        gpio_set_level(YM_CS, YM_CS_Active);
        gpio_set_level(YM_CS, YM_CS_Inactive);
        usleep(1); // 200ns YM_CS active -> inactive
        gpio_set_level(YM_WR, YM_WRRD_Inactive);
        usleep(WaitAfterDataWrite);
    }

    enum class LFO : uint8_t {
        FREQ3_98 = 0x00,
        FREQ5_56,
        FREQ6_02, 
        FREQ6_37, 
        FREQ6_88, 
        FREQ9_63, 
        FREQ48_1, 
        FREQ72_2, 
        DISABLE = 0x08
    };

    void setLfo(LFO settings) {
        const uint8_t fmAddr = 0x22;
        const uint8_t value = static_cast<uint8_t>(settings);
        fmWrite(AddrArea::CH1_3, fmAddr, value);
    }
    
    /**
     * @brief Key on or off controll
     * 
     * @param channel Select channel
     * @param onOffSlot b0-b3: slot1-4 / 0=Off, 1=On
     */
    void onOffKey(uint8_t channel, uint8_t onOffSlot) {
        const uint8_t fmAddr = 0x28;
        const uint8_t value = static_cast<uint8_t>((onOffSlot << 4) | (channel & 0x0f));
        fmWrite(AddrArea::CH1_3, fmAddr, value);
    }

    /**
     * @brief Set the Sch and Irq settings
     * 
     * @param schEn 0: ch1-3 only(OPN) / 1: ch1-6(OPNA)
     * @param irqEn b0:TA, b1:TB, b2:EOS, b3:BRDY, b4:ZERO
     */
    void setSchIrq(bool schEn, uint8_t irqEn) {
        const uint8_t fmAddr = 0x29;
        const uint8_t value = static_cast<uint8_t>((schEn ? 0x80 : 0x00) | (irqEn & 0x1f));
        fmWrite(AddrArea::CH1_3, fmAddr, value);
    }

    void setPrescaler(Prescaler setting) {
        switch(setting) {
            case Prescaler::FM1p6_SSG1p4:
                addrWrite(AddrArea::CH1_3, 0x2d);
                break;
            case Prescaler::FM1p3_SSG1p2:
                addrWrite(AddrArea::CH1_3, 0x2d);
                addrWrite(AddrArea::CH1_3, 0x2e);
                break;
            case Prescaler::FM1p2_SSH1p1:
                addrWrite(AddrArea::CH1_3, 0x2f);
                break;
            default:
                break;
        }
    }

    void setFreq(uint8_t channel, int32_t freq) {

    }

    void setFreq(uint8_t channel, int32_t note, int32_t offsetFreq) {

    }

    enum class Ch : uint8_t {
        CH1 = 0x00, CH2 = 0x01, CH3 = 0x02,
        CH4 = 0x03, CH5 = 0x04, CH6 = 0x05,
    };

    enum class Slot : uint8_t {
        SLOT1 = 0x00, SLOT2 = 0x01, SLOT3 = 0x02, SLOT4 = 0x03,
    };

    const std::array<uint8_t, 6> addrOffsetCh {0x00, 0x01, 0x02, 0x00, 0x01, 0x02};
    const std::array<uint8_t, 4> addrOffsetSlot {0x00, 0x08, 0x04, 0x0c};
    static inline uint8_t calcParamAddr(uint8_t baseAddr, Ch ch, Slot slot) {
        return static_cast<uint8_t>(baseAddr +
            addrOffsetCh[static_cast<uint8_t>(ch)] +
            addrOffsetSlot[static_cast<uint8_t>(slot)]);
    }

    /**
     * @brief Set the Dtune and Multi controll
     * 
     * @param channel CH1-6
     * @param slot Slot SLOT1-4
     * @param detune Detune 0-7 (7=-3, 6=-2, 5=-1, 4=0, 0=0, 1=1, 2=2, 3=3)
     * @param multiple Multiple 0-15 (0=1/2, 1=1, 2=2...15=15)
     */
    void setDtMulti(Ch channel, Slot slot, uint8_t detune, uint8_t multiple){

    }

    void setTl(){

    }

    void setKsAr(){

    }

    void setAmDr() {

    }

    void setSr() {

    }

    void setSlRr() {

    }

    void setSsgeg() {

    }

    void setFbAlgo() {

    }

    void setLrAmsPms() {

    }
}


} //namespace