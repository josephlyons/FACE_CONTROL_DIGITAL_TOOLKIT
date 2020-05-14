# FACE_CONTROL_DIGITAL_TOOLKIT

THE FACE CONTROL DIGITAL TOOLKIT IS THE STARTING POINT FOR CREATING FACE CONTROLLED OBJECTS.

We want to provide the tools to allow you to create expressive new interactions with the world around you.

## Manifesto
“It is important now more than ever to be inventive with interaction.”

In the rapidly developing digital world that we live in design is constantly changing and evolving. 
You interact with hundreds of digitally designed interfaces every day and often use the same outdated interactions to do so. 

The Face Control Digital Toolkit aims to provide a means for creating new interactions through the use of facial recognition and landmarking software that is open source and publicly available.

### What are face controlled objects?

The simple answer is anything that can be controlled with your face. The most immediate examples are social media filters that use facial tracking to create simple media effects. However, we believe that there is potential beyond just visual gimmicks. We want to help empower people to create a world of new interaction - to allow people to control their surrounds with their faces. 
### But... why?
Developing new and facially controlled interactions is not only important to make the world more fun - but to push the boundaries of what interactive objects are. 
Questioning why we interact with objects in the way we do. Questioning what this says about us as people. And questioning where the world of interaction, objects and design will go next. 

# Tools
Open Source Tools are provided free from a range of developers and designers. Here we detail a handful of identified tools and give you a quick insight into how they can be used within existing or new design projects. 

Understanding each of these tools and their potential allows you to take your first steps prototyping face controlled objects.
Some of  the tools rely on each other or allow you to implement aspects of the other tools. However, where it gets interesting is when you start combining some of the tools - face controlled objects can have a physical and digital manifestation simultaneously. 

The details of each of these tools can be found here, in the Face Control Digital Toolkit repo on Github. 

## FaceOSC
FaceOSC is a stand alone desktop program that will track a face and send its pose and gesture data over OSC. OSC (Open Sound Control) is a communication protocol to allow computers, synthesizers and other musical equipment to communicate.
This is a fast and easy way to allow you to interface interaction between the users face and audio. The most immediate use for this is as a plug-in in a DAW.
There are a handful of really useful templates created by Dan Wilcox which allow the user to interface with programs like Processing, Max/MSP, Puredata & OpenFrameworks.

## shiftr.io

shiftr.io is a MQTT and HTTP interface... what does that mean? Essentially its a platform that allows you to pass data in and out between different ‘Internet of Things’ connected devices. It is specifically good for developing these types of devices whilst in the prototyping stage. 
Use of ESP32 Development IOT microprocessors (essentially cheap internet connected arduinos) allows you to connect two internet connected microprocessors together or connect them to faceOSC via Processing. faceOSC & shift.io are essentially a cheap opensource face control workstation.

## clmtracker
clmtrackr is a javascript library for fitting facial models to faces in videos or images - including live video streams & webcam. It tracks a face and outputs the coordinate positions of aspects of the face. 
This allows you to take a video feed from the browser and track a face through this and implement it immediately. This means any website can be come a medium for controlling elements with your face. 
I have created an empty template based on Kyle McDonalds example on p5.js which is availbale on the digital toolkit repo.
