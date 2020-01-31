#include <M5Stack.h>
#include "ym2608_ll.h"

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
    Serial.printf("SSG Write 0x%02x: 0x%02x\n", ssgAddr, data);
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
 * @param noiseEn 
 * @param toneEn 
 */
void SSG_SetEnable(uint8_t inoutEn, uint8_t noiseEn, uint8_t toneEn) {
    const uint8_t ssgAddr = 0x07;
    const uint8_t value = static_cast<uint8_t>(
        ((inoutEn & 0x03) << 6) | ((noiseEn & 0x07) << 3) | (toneEn & 0x07));
    SSG_Write(ssgAddr, value);
}

void SSG_SetAmplitude(int32_t channel, uint8_t mode, uint8_t level) {
    const uint8_t ssgAddr = static_cast<uint8_t>(0x08U + channel);
    const uint8_t paramVal = static_cast<uint8_t>((mode & 0x01U) << 4) | (level & 0x0fU);
    SSG_Write(ssgAddr, paramVal);
}

} //namespace