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
}


void loop() {
    YM2608_LL::Write(0x02, 0xff);
    sleep(1);
}