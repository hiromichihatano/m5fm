#include <M5Stack.h>
#include <esp_task.h>

void setup() {
  // put your setup code here, to run once:
    M5.begin(true, false, true, true);
    M5.Power.begin();
    M5.Lcd.print("hello world");
}

void loop() {
  // put your main code here, to run repeatedly:
}