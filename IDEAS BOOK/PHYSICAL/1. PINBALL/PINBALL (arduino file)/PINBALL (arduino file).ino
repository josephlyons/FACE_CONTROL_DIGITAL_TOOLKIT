#include <Servo.h>

Servo servoA;
Servo servoB;

int potpin = 0;
int valA;
int valB;

void setup() {
  servoA.attach(9);
  servoB.attach(10);
  Serial.begin(9600);
}

void loop()
{
if(Serial.available())
  {
  valA = Serial.read();
  valA = map(valA, 0, 1, 180, 90);
  servoA.write(valA);

  valB = 180-valA;
  servoB.write(valB);
  
  delay(15);
  }
}
