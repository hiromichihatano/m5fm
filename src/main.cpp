#include <M5Stack.h>
#include <esp_task.h>
#include <esp32-hal-spi.h>

static const gpio_num_t YM_SPISS = GPIO_NUM_2;
static const gpio_num_t YM_CS = GPIO_NUM_5;
static const gpio_num_t YM_WR = GPIO_NUM_16;
static const gpio_num_t YM_RD = GPIO_NUM_17;
static const gpio_num_t YM_SPKOUT = GPIO_NUM_25;

static const uint32_t YM_SPISS_Active = 0U; // invert
static const uint32_t YM_SPISS_Inactive = 1U;
static const uint32_t YM_CS_Active = 0U; // invert
static const uint32_t YM_CS_Inactive = 1U;
static const uint32_t YM_WRRD_Active = 0U; // invert
static const uint32_t YM_WRRD_Inactive = 1U;

static inline uint64_t gpioBit(gpio_num_t gpionum) {return 1ULL << static_cast<uint64_t>(gpionum);}


SPIClass ymSpi(VSPI);

void io_setup() {
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
    const uint8_t init[] = {0x00, 0x00};
    ymSpi.writeBytes(init, 2); // Fill 0 before Sets SS Pin Inactive

    auto ret = gpio_set_level(YM_SPISS, YM_SPISS_Inactive); // CS pin inactive
}

void setup() {
    M5.begin(true, false, true, true);
    M5.Power.begin();
    M5.Lcd.print("hello world");
    io_setup();
    Serial.printf("end setup.\n");
}

void YM2608_Write(uint8_t a01, uint8_t data) {
    uint8_t dataAry[] = {data, a01 & 0x03U};
    gpio_set_level(YM_SPISS, YM_SPISS_Active);
    ymSpi.writeBytes(dataAry, 2);
    gpio_set_level(YM_SPISS, YM_SPISS_Inactive);
}

void YM2608_SSG_Write(uint8_t ssgAddr, uint8_t data[], int32_t len) {
    YM2608_Write(0x00, ssgAddr); // write address
    gpio_set_level(YM_CS, YM_CS_Active);
    gpio_set_level(YM_WR, YM_WRRD_Active);
    gpio_set_level(YM_CS, YM_CS_Inactive);
    // No wait cycles on SSG.
    for(int32_t i=0; i<len; i++){
        gpio_set_level(YM_CS, YM_CS_Active);
        YM2608_Write(0x00, data[i]);
        gpio_set_level(YM_CS, YM_CS_Inactive);
    }
    gpio_set_level(YM_WR, YM_WRRD_Inactive);
}

void YM2608_SSG_Write(uint8_t ssgAddr, uint8_t data) {
    YM2608_SSG_Write(ssgAddr, &data, 1);
}

static const int32_t MASTER_CLOCK = (8 * 1000 * 1000);

void YM2608_SSG_SetToneFreq(int32_t channel, int32_t toneFreq){
    const int32_t paramVal = MASTER_CLOCK / (64 * toneFreq);
    const uint8_t ssgAddrCoarse = static_cast<uint8_t>(channel * 2 + 1);
    const uint8_t ssgAddrFine = static_cast<uint8_t>(channel * 2);
    const uint8_t volCoarse = static_cast<uint8_t>(paramVal / 256);
    const uint8_t volFine = static_cast<uint8_t>(paramVal % 256);

    YM2608_SSG_Write(ssgAddrCoarse, volCoarse);
    YM2608_SSG_Write(ssgAddrFine, volFine);
}

typedef union {
    uint8_t value;
    struct {
        uint8_t inout : 2;
        uint8_t noise : 3;
        uint8_t tone : 3;
    } bits;
} ym2608_ssg_enables_t;

void YM2608_SSG_SetEnable(ym2608_ssg_enables_t enables) {
    const uint8_t ssgAddrEnable = 0x07;
    YM2608_SSG_Write(ssgAddrEnable, enables.value);
}

void YM2608_SSG_SetAmplitude(int32_t channel, uint8_t mode, uint8_t level) {
    const uint8_t ssgAddr = static_cast<uint8_t>(0x08 + channel);
    const uint8_t paramVal = ((mode & 0x01) << 4) | (level & 0x0f);
}

void loop() {
    YM2608_Write(0x02, 0xff);
    sleep(1);
}