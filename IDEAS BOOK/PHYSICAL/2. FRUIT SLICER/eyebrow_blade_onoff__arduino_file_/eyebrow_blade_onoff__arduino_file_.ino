#include <Servo.h>

Servo servoA;
int valA;

void setup() {
  servoA.attach(10);
  Serial.begin(9600);
}

void loop()
{
if(Serial.available())
  {
  valA = Serial.read();
  valA = map(valA, 0, 1, 45, 100);
  servoA.write(valA);
  
  delay(15);
  }
}
