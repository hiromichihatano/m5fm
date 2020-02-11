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

namespace FM {
    enum class AddrArea { CH1_3, CH4_6};
    enum class Prescaler { FM1p6_SSG1p4, FM1p3_SSG1p2, FM1p2_SSH1p1};

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

    enum class Ch : uint8_t {
        CH1 = 0x00, CH2 = 0x01, CH3 = 0x02,
        CH4 = 0x03, CH5 = 0x04, CH6 = 0x05,
    };

    enum class Slot : uint8_t {
        SLOT1 = 0x00, SLOT2 = 0x01, SLOT3 = 0x02, SLOT4 = 0x03,
    };

    enum class FNUM_NOTE:uint16_t {
        Cs = 654,
        D = 693,
        Ds = 734,
        E = 778,
        F = 824,
        Fs = 873,
        G = 925,
        Gs = 980,
        A = 1038,
        As = 1100,
        B = 1165,
        C = 1235
    };


    void addrWrite(AddrArea addrArea, uint8_t fmAddr);
    void fmWrite(AddrArea addrArea, uint8_t fmAddr, uint8_t data);
    void setLfo(LFO settings);
    void onOffKey(Ch channel, uint8_t onOffSlot);
    void setSchIrq(bool schEn, uint8_t irqEn);
    void setPrescaler(Prescaler setting);
    void setBlockFnum(Ch channel, uint8_t block, uint16_t fNumber);
    void setBlockFnum(Ch channel, uint8_t block, FNUM_NOTE note);
    void setFreq(Ch channel, uint32_t freq);
    void setDtMulti(Ch channel, Slot slot, uint8_t detune, uint8_t multiple);
    void setTl(Ch channel, Slot slot, uint8_t totalLevel);
    void setKsAr(Ch channel, Slot slot, uint8_t ks, uint8_t attackRate);
    void setAmDr(Ch channel, Slot slot, bool amon, uint8_t decayRate);
    void setSr(Ch channel, Slot slot, uint8_t sustainRate);
    void setSlRr(Ch channel, Slot slot, uint8_t sustainLevel, uint8_t releaseRate);
    void setSsgEg(Ch channel, Slot slot, uint8_t envType);
    void setFbAlgo(Ch channel, uint8_t feedback, uint8_t algorithm);
    void setLRAmsPms(Ch channel, bool lOut, bool rOut, uint8_t ams, uint8_t pms);
} /* namespace FM */

}