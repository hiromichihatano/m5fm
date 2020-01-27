#include <M5Stack.h>

namespace YM2608_LL
{

typedef union {
    uint8_t value;
    struct {
        uint8_t inout : 2;
        uint8_t noise : 3;
        uint8_t tone : 3;
    } bits;
} ssg_enables_t;

void Setup();
void Write(uint8_t a01, uint8_t data);
void SSG_Write(uint8_t ssgAddr, uint8_t data[], int32_t len);
void SSG_Write(uint8_t ssgAddr, uint8_t data);
void SSG_SetToneFreq(int32_t channel, int32_t toneFreq);
void SSG_SetEnable(ssg_enables_t enables);
void SSG_SetAmplitude(int32_t channel, uint8_t mode, uint8_t level);
}