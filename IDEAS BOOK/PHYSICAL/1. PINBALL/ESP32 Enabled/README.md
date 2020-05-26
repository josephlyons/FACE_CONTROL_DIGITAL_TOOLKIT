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

## Modifying Hardware

The setup on an ESP32 and an Arduino is almost identialy except that the pins are different. In the code you use pins 13 and 14 and these are labeled on the ESP32 as IO13 and IO14.

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/images/pins.jpg?raw=true)

# Setup with Arduino IDE

Setting up an ESP32 Dev Board with the Arduino IDE is not obvious or well documented, but here is what you need to do.

Go to: File, Preferences, then Paste the below into the Additional Boards Manager URLs.
" https://dl.espressif.com/dl/package_esp32_index.json
http://arduino.esp8266.com/stable/package_esp8266com_index.json "

Then Navigate to Tools and ensure all of the settings are the same as these.

![Tools settings screenshot](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/images/Tools%20settings%20screenshot.png?raw=true)

Then select 'Port' and click the relevant port for your ESP32 Dev Board.

The Arduino IDE is now setup for use with the ESP32 Board, and this is universal for any sketch or work you are doing with an ESP32.

## Understanding the example

Here I am discussing the above example in the folder [RECIEVE_pinball](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/tree/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/RECIEVE_pinball "RECIEVE_pinball") 
which is being used to allow a minature pinball machine to recieve data from shiftr.io to trigger the pinball machine, in this case the data is dictated by the height of the users eyebrows.

The sketch begins with the libary initialisers. We are using 3 in this example.

> #include <WiFi.h>
> #include <MQTT.h>
> #include <Servo_ESP32.h>

'WiFi.h' allows you to use wifi, 'MQTT.h' allows you to connect using MQTT. For this particular example we are using Servo Motors, unlike using an arduino in which you would use the normal arduino servo library 'Servo.h', we need to use a libary that is compatible with ESP32 - and so we use the library 'Servo_ESP32.h'.

> Servo_ESP32 servoA;
> Servo_ESP32 servoB;

We then initialise the two servos we are using.

> int Rval = 0;
> int valA;
> int valB;
> const char* eyebrows = "/eyebrows";
> const char ssid[] = "wifi4daboys";
> const char pass[] = "Waffles666";

We then initialise all of the integers used in the sketch, aswell as creating a constant char for eyebrows. And finally we create strings for the ssid and password of your wifi, in my case the wifi name is changed to "wifi4daboys" and our wifi password is "Waffles666", but a more normal example might be an ssid of "BT-5RA555" and "Password123"... whatever your wifi is called and the corresponding password.

> WiFiClient net;
> MQTTClient client;
> unsigned long lastMillis = 0;

Next we establish the WiFi Client and MQTT Client and establish an unsigned long for time passing in milliseconds to begin at 0.

>void connect() {
>   while (WiFi.status() != WL_CONNECTED) {}
>   while (!client.connect("recieve", "90a85098", "a7fed12984960679")) {}
>   client.subscribe(eyebrows);
> }

Okay! Now into the running code - here we establish a connection with shiftr.io. This block of code is ran later on within the setup when "connect()" is called. You will need to change the two chunks of numbers and letters ( "90a85098", "a7fed12984960679"), known as the 'Key' and 'Secret' to the corresponding ones from your own shiftr.io namespace. How to do that linked here:
[Creating a Shiftr.io Namespace](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/tree/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace)



> void messageReceived(String &topic, String &payload) 
> {
>   if (topic==eyebrows)
>    {
>     Rval = payload.toInt();
>     }
> }

This block of code is executed when "messageReceived()" is called in the setup within "client.onMessage" it takes the String message that arrives from the topic eyebrows and places it into an integer called "Rval".

>void setup() 
>{
>  servoA.attach(13);
>  servoB.attach(14);
>  WiFi.begin(ssid, pass);
>  client.begin("broker.shiftr.io", net);
>  client.onMessage(messageReceived);
>  connect();
>}

Here we have the setup. You can see servo A and b are attached to pins 13 and 14 on the ESP32. We initiallise the Wifi and pass in the Strings of the wifi name and password (ssid & pass). The MQTT client connects to the shiftr.io broker, and begins listening to messages. "connect()" is called which runs the above mentioned "void connect" code.

> void loop() 
> {
>  client.loop();
>   delay(10);
> 
>   if (!client.connected()) {
>     connect();
>   }
>   
> if (client.connected())
>   {
>  valB = 180-valA;
>     if(Rval == 1) // frown
>     {
>       valA = 180;
>       servoA.write(valA);
>       servoB.write(valB);
>     }
>       else if(Rval == 2) //raise
>      {
>        valA = 90;
>        servoA.write(valA);
>        servoB.write(valB);
>     }
>         else //neutral
>        {
>          valA = 180;
>           servoA.write(valA);
>           servoB.write(valB);
>         }
> delay(15);
>   }
> }

Here we have the loop. At the beginning of the loop we connect to the client. 
Here we use valA and valB to control servoA and servoB respectively, and so we establish that valB is 180 - valA so that the angle of the servos is inverted for the pinball machine.
Then once this has happened there is some simple "if, else if, else" logic that is determining whether the Rval integer - which is taken from the String message sent via shiftr.io (from processing and ultimately from your eyebrows) - matches either a 1 or a 2, and depending on which of these is true it changes the angle of the servo motors.

And that sums up the explaination of the arduino code.

# Setup with Processing


## Key Send Test

You will need to use the processing sketch [Processing Key Send](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/processing_key_send/processing_key_send.pde) to test if this is working.

This, and the "Processing Eyebrow Send" code is also compatible with the "Open Source Pong" Digital Example from The Face Control Kit. And that is why you get the option of 1, 2 and 3 to be send - since the Pong example uses both a "Raise", "Neutral" and "Frown" pose as control triggers. However, in this particular example we are only using "Raise" and "Neutral", raise to trigger the pinball paddles and neutral in all other cases.

> import mqtt.*;
> MQTTClient client:

Here we import the mqtt library into process and establish this sketch as a client.

>void setup() 
>{
>  size(360, 360); 
>  client = new MQTTClient(this);
>  client.connect("mqtt://90a85098:a7fed12984960679@broker.shiftr.io", "processing via keys");
>   
>    client.publish("/eyebrows", "0");
>     background(0, 0, 250);
> }

Here we have the setup. "size(360, 360)" draws a canvas of that size. We then establish the sketch as a mqtt cleint again and use the namespace token address to connect to our namespace. "processing via keys" names the sketches location in the namespace so that when messages are passed into shiftr.io you can see they are from this sketch.

I then send a one of "0" message to the namespace to the namespace to ensure that the pins begin in the downward position (and in open source pong this establishes the paddle as not moving - it also means that if you were to modify the RC Skateboard example to be wifi enabled, it would establish itself as not moving.)
"background(0, 0 , 250)" sets the background to blue in accordance to the colour coding later on.

> void draw() {}

in this example the draw loop is empty because there is no code that continually happens without a different function happening.

> void keyPressed() 
> {
>   if (key == '1') { //1
>   client.publish("/eyebrows", "1"); //raise 
>   background(250, 250, 0);
>   rect(170, 25, 25, 300);
>   } else if (key == '2') { //2
>     client.publish("/eyebrows", "2"); //frown
>     background(0, 250, 0);
>     rect(150, 25, 25, 300);
>     rect(190, 25, 25, 300);
>     } else if (key == '3') { //3 //neutral
>       client.publish("/eyebrows", "0");
>       background(0, 0, 250);
>      rect(130, 25, 25, 300);
>    rect(170, 25, 25, 300);
>     rect(210, 25, 25, 300);
>       }
> delay(15);        
>  }

Here we have the keyPressed function. In this case detects which key is being pressed (1, 2 or 3) and runs a small amount of code for each of these scenarios. Firstly it publishes a message in the form of a string of "1", "2", or "3", dependant on which key is pressed, to the /eyebrows topic. For each different option it sets the background to a different colour and draws either 1 2 or 3 rectangles on the screen to represent each selection.

> void clientConnected() {
>   println("client connected");
> 
>   client.subscribe("/hello");
> }
>
> void messageReceived(String topic, byte[] payload) {
>   println("new message: " + topic + " - " + new String(payload));
> }
>
> void connectionLost() {
>   println("connection lost");
> }

Here we have the rest of the code required to allow processing to connect to shiftr.io properly. To be completely honest I'm not sure what's going on here but Joel from shiftr.io does! You can see the shiftr.io [Documentation](https://docs.shiftr.io/) page for more info.

If you have this running properly it will be allowing you to control the pinball with the number keys on your keyboard! The next step is to get it running with your eyebrows.

## Eyebrow Send


