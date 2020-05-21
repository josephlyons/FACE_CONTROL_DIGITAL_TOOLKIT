import oscP5.*; //  Load OSC P5 library
import netP5.*; //  Load net P5 library
import mqtt.*;  // Load mqtt library
float eyebrow;

MQTTClient client;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() 
{
size(360, 360); 
frameRate(5);
client = new MQTTClient(this);
client.connect("mqtt://ef96b90f:47dae9794858bd36@broker.shiftr.io", "player 2");
client.publish("/pong", "0");
background(0, 0, 250);

oscP5 = new OscP5(this, 8338);   // Start oscP5, listening for incoming messages at port 8338 
}

void draw()
{
  if (eyebrow > 7.3 && eyebrow < 8.5){  //anywhere from 7.3 to 8.5 = neutral
    background(0, 0, 250);
    rect(130, 25, 25, 300);
    rect(170, 25, 25, 300);
    rect(210, 25, 25, 300);
    textSize(32);
    text("neutral", 10, 30); 
    fill(0, 102, 153);
    } else if (eyebrow < 7.3) { // below 7 frown
      background(0, 250, 0);
      rect(150, 25, 25, 300);
      rect(190, 25, 25, 300);
      textSize(32);
      text("frown", 10, 30); 
      fill(0, 102, 153);
      } else if (eyebrow > 8.5) { //above 8.5 raise
        background(250, 250, 0);
        rect(170, 25, 25, 300);
        textSize(32);
        text("raise", 10, 30); 
        fill(0, 102, 153);
         }
}

void oscEvent(OscMessage theOscMessage) 
{
if (theOscMessage.checkAddrPattern("/gesture/eyebrow/left")==true) 
  {
  float firstValue = theOscMessage.get(0).floatValue();
  eyebrow = firstValue; //get osc data for left eyebrow and put it into float "eyebrow"

  if (eyebrow > 7.3 && eyebrow < 8.5){  //from 7.3 to 8.5 = neutral
    client.publish("/pong", "0"); 
    } else if (eyebrow < 7.3) { // below 7 = frown
      client.publish("/pong", "2"); 
      } else if (eyebrow > 8.5) { //above 8.5 = raise
        client.publish("/pong", "1"); 
        }
delay(15);
  }
}
  

  
void clientConnected() {
  println("client connected");

  client.subscribe("/hello");
}

void messageReceived(String topic, byte[] payload) {
  println("new message: " + topic + " - " + new String(payload));
}

void connectionLost() {
  println("connection lost");
}
