# ESP32 Enabling

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
