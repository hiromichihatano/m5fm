#include <M5Stack.h>

namespace YM2608_LL
{
void Setup();
void Write(uint8_t a01, uint8_t data);
void SSG_Write(uint8_t ssgAddr, uint8_t data[], int32_t len);
void SSG_Write(uint8_t ssgAddr, uint8_t data);
void SSG_SetToneFreq(int32_t channel, int32_t toneFreq);
void SSG_SetEnable(uint8_t inoutEn, uint8_t noiseEn, uint8_t toneEn);
void SSG_SetAmplitude(int32_t channel, uint8_t mode, uint8_t level);
}