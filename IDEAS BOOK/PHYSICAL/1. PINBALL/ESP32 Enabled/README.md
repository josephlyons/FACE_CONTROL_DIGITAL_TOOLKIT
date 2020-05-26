# ESP32 EBC Pinball

This is a guide to taking a project based on Arduino and locally controlled and translating it onto ESP32 Dev Boards as to allow it to be controlled by processing via Shiftr.io. I will show two examples - controlling the project with keyboard keys & controlling it with your eyebrows!

## What is an ESP32?

An ESP32 is a microcontroller board used for the development of WiFi & Bluetooth enabled projects.

## Which one do I buy?

Any ESP32 Dev board that you can buy should be fine as long as it works! However for ease of use, getting a pre-solded board with mounts makes prototyping much easier & faster. I also chose to get a board that resembles an Arduino which makes it a little more friendly and easy to understand.

![esp32 board I chose](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/images/esp32%20dev%20board%20studio%20pic.png?raw=true)

Link:
[https://www.banggood.com/LILYGO-TTGO-ESP32-WiFi-bluetooth-Board-4MB-Flash-UNO-D1-R32-Development-Board-p-1163967.html?rmmds=search&cur_warehouse=UK](https://www.banggood.com/LILYGO-TTGO-ESP32-WiFi-bluetooth-Board-4MB-Flash-UNO-D1-R32-Development-Board-p-1163967.html?rmmds=search&cur_warehouse=UK)

This one was a little more expensive than the others but in my opinion is worth it for the ease of use and setup.

# Setup with Arduino IDE

Setting up an ESP32 Dev Board with the Arduino IDE is not obvious or well documented, but here is what you need to do.

Go to: File, Preferences, then Paste the below into the Additional Boards Manager URLs.
" https://dl.espressif.com/dl/package_esp32_index.json
http://arduino.esp8266.com/stable/package_esp8266com_index.json "

Then Navigate to Tools and ensure all of the settings are the same as these.

![Tools settings screenshot](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/images/Tools%20settings%20screenshot.png?raw=true)

Then select 'Port' and click the relevant port for your ESP32 Dev Board.

The Arduino IDE is now setup for use with the ESP32 Board, and this is universal for any sketch or work you are doing with an ESP32.

# Understanding the example

The sketch begins with the libary initialisers. We are using 3 in this example.

> #include <WiFi.h>
#include <MQTT.h>
#include <Servo_ESP32.h>

'WiFi.h' allows you to use wifi, 'MQTT.h' allows you to connect using MQTT. For this particular example we are using Servo Motors, unlike using an arduino in which you would use the normal arduino servo library 'Servo.h', we need to use a libary that is compatible with ESP32 - and so we use the library 'Servo_ESP32.h'.

> Servo_ESP32 servoA;
Servo_ESP32 servoB;

We then initialise the two servos we are using.

> int Rval = 0;
int valA;
int valB;
const char* eyebrows = "/eyebrows";
const char ssid[] = "wifi4daboys";
const char pass[] = "Waffles666";

We then initialise all of the integers used in the sketch, aswell as creating a constant char for eyebrows. And finally we create strings for the ssid and password of your wifi, in my case the wifi name is changed to "wifi4daboys" and our wifi password is "Waffles666", but a more normal example might be an ssid of "BT-5RA555" and "Password123"... whatever your wifi is called and the corresponding password.

> WiFiClient net;
MQTTClient client;
unsigned long lastMillis = 0;

Next we establish the WiFi Client and MQTT Client and establish an unsigned long for time passing in milliseconds to begin at 0.

>void connect() {
  while (WiFi.status() != WL_CONNECTED) {}
  while (!client.connect("recieve", "90a85098", "a7fed12984960679")) {}
  client.subscribe(eyebrows);
}

Okay! Now into the running code - here we establish a connection with shiftr.io. This block of code is ran later on within the setup when "connect()" is called. You will need to change the two chunks of numbers and letters ( "90a85098", "a7fed12984960679"), known as the 'Key' and 'Secret' to the corresponding ones from your own shiftr.io namespace. How to do that linked here:
[https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/tree/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/tree/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace)
Or navigate to the folder above called "Creating a Shiftr.io Namespace".




