# Eyebrow - RC Skateboard


Tony Hawk Circuit Board RC Skateboard hack using an Arduino & a handful of software to allow the user to control the skateboard using only their eyebrows & a webcam.


## Required Materials





**Components**

1 x Tony Hawk Circuit Board RC Skateboard \(by Hexbugs\) \(~£7\)

1 x Arduino Uno \(~£7\)

4 x 2k2 Resistors \(&lt;£1\)

4 x 3k3 Resistors \(&lt;£1\)

15 x Jumper Cables \(~£2\)

1 x Breadboard \(~£2\)

1 x 20cm Length of multi-core cable \(&lt;£1\)

1 x 30cm length of solder \(&lt;£1\)

_Total = ~£20_

​

**Tools**

Soldering Iron

Blade/Flathead Screwdriver \(for popping remote open\)

​

**Softwares**

FaceOSC - For facial landmarking

Puredata - For processing OSC data into Arduino

Arduino IDE - For coding Arduino Uno to recieve this data and output it to the remote





## Software Guide







**Puredata**

Pure Data \(or just Pd \) is an open source visual programming language for multimedia. It is very similar to Max/MSP and shares a lot of the same language and structure.

﻿

**openFrameworks**

openFrameworks is an open source toolkit for creative coding.

﻿

**ofxFaceTracker**

ofxFaceTracker is openFrameworks addon for face tracking, based on Jason Saragih's FaceTracker library.

﻿

**FaceOSC**

FaceOSC sends as much data as possible from ofxFaceTracker via OSC, including its pose/position and gestural data, and its raw points.

﻿

**OSC**

Open Sound Control \(OSC\) is a protocol for communication among computers, sound synthesizers, and other multimedia devices that is optimized for modern networking technology.

​

**Arduino**

Open-source electronic prototyping platform enabling users to create interactive electronic objects.






## 1. Prepare Breadboard


Begin by plugging in all the resistors and jumper cables into the breadboard in the following formation:

​

![image](https://wikifactory.com/files/RmlsZTozMTk0OTA=)

_Figure 1 - Electronic Layout_

​

Here you can see an Arduino Uno Rev 3, Breadboard, 2k2 resistors \(diagonal\) and 3k3 resistors \(vertical\) \[ignore the bands on the diagram\].

​

The digital pins are connected through this resistor setup to the buttons on the remote, with a ground connecting from any one of the buttons to the shared ground of the system.

​

![image](https://wikifactory.com/files/RmlsZTozMTk0OTE=)

_Figure 2 - Arduino & Breadboard_

​

Arrangement in the photo is slightly different as the illustration of the layout was edited for clarity, but the signal path is all the same.


## 2. Hack the Remote


Unfortunately I don't have any photos of the remote before I soldered it, however it should be easy enough to understand what's going on from the after photos.

​

![image](https://wikifactory.com/files/RmlsZTozMTk0OTY=)

_Figure 3 - Top & Bottom of the PCB_ 

​

Here you can see the contact points for soldering on the wires that are attached to the breadboard.

## 3. Arduino Code

The next step is to install the code onto the Arduino. For this you will need to download the Arduino IDE:

https://www.arduino.cc/en/Main/Software

​

Once installed open the software & connect your Arduino via USB cable. 

​

Go to Tools/Board: and select the correct board.

Go to Tools/Port and select the port that shows up with your Arduino.

​

Copy & Paste into the software, Save file into your sketches folder, then Verify and Upload this sketch:

​

> int LB = 9;
>
> int RB = 10;
>
> int LF = 11;
>
> int RF = 12;
>
>
>
> int val;
>
>
>
> void setup\(\) {
>
>   Serial.begin\(9600\);
>
>   pinMode\(LB, OUTPUT\);
>
>   pinMode\(RB, OUTPUT\);
>
>   pinMode\(LF, OUTPUT\);
>
>   pinMode\(RF, OUTPUT\);
>
> }
>
>
>
> void loop\(\)
>
> {
>
> if\(Serial.available\(\)\)
>
>   {
>
>   val = Serial.read\(\);
>
>   
>
>     if\(val == 1\) //backward
>
>     {
>
>     digitalWrite\(LB, LOW\);
>
>     digitalWrite\(RB, LOW\);
>
>     digitalWrite\(LF, HIGH\);
>
>     digitalWrite\(RF, HIGH\);
>
>     }
>
>
>
>       else if\(val == 3\) //forward
>
>       {
>
>       digitalWrite\(LB, HIGH\);
>
>       digitalWrite\(RB, HIGH\);
>
>       digitalWrite\(LF, LOW\);
>
>       digitalWrite\(RF, LOW\);
>
>       }
>
>
>
>       
>
>         else //still
>
>         {
>
>         digitalWrite\(LB, HIGH\);
>
>         digitalWrite\(RB, HIGH\);
>
>         digitalWrite\(LF, HIGH\);
>
>         digitalWrite\(RF, HIGH\);
>
>         }
>
>   }
>
> }

_Figure 4 - Arduino Sketch_

​

This sketch simply allows the Arduino to hold 'HIGH' the buttons that aren't being pressed and simulate a 'LOW' to mimic a button press.

This is trigged by the Puredata code.

​

Once uploaded onto the Arduino you don't need this software to be open anymore.

## 4. Puredata Code

Download & install Puredata extended edition:

https://puredata.info/downloads/pd-extended

​

Download and open this patch:

https://github.com/josephlyons/RC-Skateboard-Eyebrow-Hack/tree/master/puredata

​

It should look somewhat like this \(ignoring the messages on left window\):

​

![image](https://wikifactory.com/files/RmlsZTozMTk1Mjk=)

_Figure 5 - puredata patch_

​

​

Go to Edit/Edit Mode so that you can edit objects.

Edit the comport object so that the number matches the comport from the arduino software. For example if Arduino says 'COM16' edit the comport object to say 'comport 16 9600'

Save the patch.

​

This software needs to be running continuously whilst controlling the skateboard.

## 5. FaceOSC

Download & Install FaceOSC:

﻿https://github.com/kylemcdonald/ofxFaceTracker/releases﻿ 

﻿

This software will use your webcam to track locations on your face and give numeric measurements for a series of values. It will then send this over OSC to puredata.

​

Once you've got it running it should look somewhat like this \(except with your face\):

![image](https://wikifactory.com/files/RmlsZTozMTk1Mzc=)

_Figure 6 - FaceOSC running_

​

If you wish to use an external webcam, for example, if you didn't want people using this to be looking at a laptop screen. Go to the program files FaceOSC/Data/Settings which should be a text document, and edit the 'Devices Number' to 1.

​

This software needs to be running continuously whilst controlling the skateboard.

## Enjoy

With FaceOSC & Puredata running you should be able to control the skateboard.

​

Enjoy!