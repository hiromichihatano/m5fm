#include <M5Stack.h>
#include <esp_task.h>
#include <esp32-hal-spi.h>
#include "ym2608_ll.h"



void setup() {
    M5.begin(true, false, true, true);
    M5.Power.begin();
    M5.Lcd.print("hello world");
    YM2608_LL::Setup();
    Serial.printf("end setup.\n");
    YM2608_LL::SSG_SetAmplitude(0, 0, 15);
    YM2608_LL::SSG_SetAmplitude(1, 0, 15);
    YM2608_LL::SSG_SetAmplitude(2, 0, 15);
}


void loop() {
    YM2608_LL::SSG_SetEnable(0x00, 0x07, 0x06);
    YM2608_LL::SSG_SetToneFreq(0, 2000);
    usleep(1000*200);
    YM2608_LL::SSG_SetToneFreq(0, 1000);
    usleep(1000*200);
    YM2608_LL::SSG_SetEnable(0x00, 0x07, 0x07);
    sleep(5);
}