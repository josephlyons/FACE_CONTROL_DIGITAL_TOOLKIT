#include <WiFi.h>
#include <MQTT.h>
#include <Servo_ESP32.h>

Servo_ESP32 servoA;
Servo_ESP32 servoB;

int Rval = 0;

int valA;
int valB;

const char* eyebrows = "/eyebrows";

const char ssid[] = "wifi4daboys";
const char pass[] = "Waffles666";

WiFiClient net;
MQTTClient client;

unsigned long lastMillis = 0;

void connect() {
  while (WiFi.status() != WL_CONNECTED) {}
  while (!client.connect("recieve", "90a85098", "a7fed12984960679")) {}
  client.subscribe(eyebrows);
  // client.unsubscribe("/joe");
}

void messageReceived(String &topic, String &payload) 
{
  if (topic==eyebrows)
    {
    Rval = payload.toInt();
    }
}

void setup() 
{
  servoA.attach(13);
  servoB.attach(14);
  WiFi.begin(ssid, pass);
  client.begin("broker.shiftr.io", net);
  client.onMessage(messageReceived);
  connect();
}

void loop() 
{
  client.loop();
  delay(10);

 if (!client.connected()) {
    connect();
 }
{
valB = 180-valA;
if(Rval == 1) // frown
    {
      valA = 180;
      servoA.write(valA);
      servoB.write(valB);
    }
      else if(Rval == 2) //raise
      {
        valA = 90;
        servoA.write(valA);
        servoB.write(valB);
      }
        else //neutral
        {
          valA = 180;
          servoA.write(valA);
          servoB.write(valB);
        }
delay(15);
  }
}
