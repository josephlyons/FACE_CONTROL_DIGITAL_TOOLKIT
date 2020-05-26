import mqtt.*;

MQTTClient client;

void setup() 
{
  size(360, 360); 
  client = new MQTTClient(this);
  client.connect("mqtt://90a85098:a7fed12984960679@broker.shiftr.io", "processing via keys");
  
    client.publish("/eyebrows", "0");
    background(0, 0, 250);
}

void draw() {}

void keyPressed() 
{
  if (key == '1') { //1
  client.publish("/eyebrows", "1"); //raise 
  background(250, 250, 0);
  rect(170, 25, 25, 300);
  } else if (key == '2') { //2
    client.publish("/eyebrows", "2"); //frown
    background(0, 250, 0);
    rect(150, 25, 25, 300);
    rect(190, 25, 25, 300);
    } else if (key == '3') { //3 //neutral
      client.publish("/eyebrows", "0");
      background(0, 0, 250);
    rect(130, 25, 25, 300);
    rect(170, 25, 25, 300);
    rect(210, 25, 25, 300);
      }
delay(15);        
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
