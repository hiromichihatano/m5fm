#include <M5Stack.h>
#include <esp_task.h>
#include <esp32-hal-spi.h>
#include "ym2608_ll.h"



void ssgTest() {
    YM2608_LL::SSG_SetEnable(0x00, 0x07, 0x06);
    YM2608_LL::SSG_SetToneFreq(0, 2000);
    usleep(1000*100);
    YM2608_LL::SSG_SetToneFreq(0, 1000);
    usleep(1000*100);
    YM2608_LL::SSG_SetEnable(0x00, 0x07, 0x07);
}


void fmSetup() {
    namespace fm = YM2608_LL::FM;
    fm::setSchIrq(true, 0x00);

    // CH1
    fm::setFbAlgo(fm::Ch::CH1, 0, 6);
    fm::setBlockFnum(fm::Ch::CH1, 4, fm::FNUM_NOTE::A);
    fm::setDtMulti(fm::Ch::CH1, fm::Slot::SLOT1, 0, 1);
    fm::setDtMulti(fm::Ch::CH1, fm::Slot::SLOT2, 0, 1);

    fm::setTl(fm::Ch::CH1, fm::Slot::SLOT1, 0);
    fm::setKsAr(fm::Ch::CH1, fm::Slot::SLOT1, 0, 31);
    fm::setAmDr(fm::Ch::CH1, fm::Slot::SLOT1, false, 10);
    fm::setSlRr(fm::Ch::CH1, fm::Slot::SLOT1, 15, 13);
    fm::setSr(fm::Ch::CH1, fm::Slot::SLOT1, 10);

    fm::setTl(fm::Ch::CH1, fm::Slot::SLOT2, 0);
    fm::setKsAr(fm::Ch::CH1, fm::Slot::SLOT2, 0, 31);
    fm::setAmDr(fm::Ch::CH1, fm::Slot::SLOT2, false, 5);
    fm::setSlRr(fm::Ch::CH1, fm::Slot::SLOT2, 15, 13);
    fm::setSr(fm::Ch::CH1, fm::Slot::SLOT2, 10);

    fm::setLRAmsPms(fm::Ch::CH1, true, true, 0, 0);

    // CH2
    fm::setFbAlgo(fm::Ch::CH2, 0, 6);
    fm::setBlockFnum(fm::Ch::CH2, 4, fm::FNUM_NOTE::A);
    fm::setDtMulti(fm::Ch::CH2, fm::Slot::SLOT1, 0, 0);
    fm::setDtMulti(fm::Ch::CH2, fm::Slot::SLOT2, 0, 1);

    fm::setTl(fm::Ch::CH2, fm::Slot::SLOT1, 0);
    fm::setKsAr(fm::Ch::CH2, fm::Slot::SLOT1, 0, 8);
    fm::setAmDr(fm::Ch::CH2, fm::Slot::SLOT1, false, 31);
    fm::setSlRr(fm::Ch::CH2, fm::Slot::SLOT1, 0, 9);
    fm::setSr(fm::Ch::CH2, fm::Slot::SLOT1, 10);

    fm::setTl(fm::Ch::CH2, fm::Slot::SLOT2, 0);
    fm::setKsAr(fm::Ch::CH2, fm::Slot::SLOT2, 0, 31);
    fm::setAmDr(fm::Ch::CH2, fm::Slot::SLOT2, false, 31);
    fm::setSlRr(fm::Ch::CH2, fm::Slot::SLOT2, 0, 9);
    fm::setSr(fm::Ch::CH2, fm::Slot::SLOT2, 5);

    fm::setLRAmsPms(fm::Ch::CH2, true, false, 0, 0);

    // CH3
    fm::setFbAlgo(fm::Ch::CH3, 5, 6);
    fm::setBlockFnum(fm::Ch::CH3, 4, fm::FNUM_NOTE::A);
    fm::setDtMulti(fm::Ch::CH3, fm::Slot::SLOT1, 0, 4);
    fm::setDtMulti(fm::Ch::CH3, fm::Slot::SLOT2, 0, 1);

    fm::setTl(fm::Ch::CH3, fm::Slot::SLOT1, 0);
    fm::setKsAr(fm::Ch::CH3, fm::Slot::SLOT1, 0, 31);
    fm::setAmDr(fm::Ch::CH3, fm::Slot::SLOT1, false, 10);
    fm::setSlRr(fm::Ch::CH3, fm::Slot::SLOT1, 15, 13);
    fm::setSr(fm::Ch::CH3, fm::Slot::SLOT1, 10);

    fm::setTl(fm::Ch::CH3, fm::Slot::SLOT2, 0);
    fm::setKsAr(fm::Ch::CH3, fm::Slot::SLOT2, 0, 31);
    fm::setAmDr(fm::Ch::CH3, fm::Slot::SLOT2, false, 5);
    fm::setSlRr(fm::Ch::CH3, fm::Slot::SLOT2, 15, 13);
    fm::setSr(fm::Ch::CH3, fm::Slot::SLOT2, 10);

    fm::setLRAmsPms(fm::Ch::CH3, false, true, 0, 0);
}


void setup() {
    M5.begin(true, false, true, true);
    M5.Power.begin();
    M5.Lcd.print("Setup...");
    YM2608_LL::Setup();
    Serial.printf("end setup.\n");
    YM2608_LL::SSG_SetAmplitude(0, 0, 15);
    YM2608_LL::SSG_SetAmplitude(1, 0, 15);
    YM2608_LL::SSG_SetAmplitude(2, 0, 15);
    YM2608_LL::SSG_SetEnable(0x00, 0x07, 0x07);
    YM2608_LL::FM::setPrescaler(YM2608_LL::FM::Prescaler::FM1p6_SSG1p4);
    usleep(50000);
    // M5.Lcd.print("Done\n");
    ssgTest();
    fmSetup();
}

void fmTest() {
    namespace fm = YM2608_LL::FM;

    if(M5.BtnA.wasPressed()) {
        fm::onOffKey(fm::Ch::CH1, 0x03);
        // M5.Lcd.print("Ch1 note ON\n");
    } else if (M5.BtnA.wasReleased()){
        fm::onOffKey(fm::Ch::CH1, 0x00);
        // M5.Lcd.print("Ch1 note OFF\n");
    }

    if(M5.BtnB.wasPressed()) {
        fm::onOffKey(fm::Ch::CH2, 0x03);
        // M5.Lcd.print("Ch2 note ON\n");
    } else if (M5.BtnB.wasReleased()){
        fm::onOffKey(fm::Ch::CH2, 0x00);
        // M5.Lcd.print("Ch2 note OFF\n");
    }

    if(M5.BtnC.wasPressed()) {
        fm::onOffKey(fm::Ch::CH3, 0x03);
        // M5.Lcd.print("Ch3 note ON\n");
    } else if (M5.BtnC.wasReleased()){
        fm::onOffKey(fm::Ch::CH3, 0x00);
        // M5.Lcd.print("Ch3 note OFF\n");
    }
}

void loop() {
    fmTest();
    m5.update();
}