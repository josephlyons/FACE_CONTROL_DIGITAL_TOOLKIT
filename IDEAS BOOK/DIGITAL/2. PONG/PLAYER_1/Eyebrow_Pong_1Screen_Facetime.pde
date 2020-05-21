Ball ball; // Define the ball as a global object 

Paddle paddleLeft;
Paddle paddleRight;

int scoreLeft = 0;
int scoreRight = 0;


//EYEBROW SHIT
import oscP5.*; //  Load OSC P5 library
import netP5.*; //  Load net P5 library
import mqtt.*;  // Load mqtt library
float eyebrow;

MQTTClient client;
OscP5 oscP5;
NetAddress myRemoteLocation;

int Rval = 0;

void setup(){
client = new MQTTClient(this);
client.connect("mqtt://ef96b90f:47dae9794858bd36@broker.shiftr.io", "Pong");
client.subscribe("/pong");

oscP5 = new OscP5(this, 8338);   // Start oscP5, listening for incoming messages at port 8338 

  size(800,600);
  ball = new Ball(width/2, height/2, 50); //create a new ball to the center of the window
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30,200);


}

void draw(){
  background(0); //clear canvas
  ball.display(); // Draw the ball to the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball on the window
  
  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

  
  if (ball.right() > width) {
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  
  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  
  // If the ball gets behind the paddle 
  // AND if the ball is int he area of the paddle (between paddle top and bottom)
  // bounce the ball to other direction

  if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
  }

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
  }
  
  
  textSize(40);
  textAlign(CENTER);
  text(scoreRight, width/2+30, 30); // Right side score
  text(scoreLeft, width/2-30, 30); // Left side score
}

void keyPressed(){
  client.publish("/joe", "world");///  SHIFTR.IO EDIT BY JOE
  if(keyCode == UP){
    paddleRight.speedY=-3;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=3;
  }
  if(key == 'w'){
    paddleLeft.speedY=-3;
  }
  if(key == 's'){
    paddleLeft.speedY=3;
  }
}

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'w'){
    paddleLeft.speedY=0;
  }
  if(key == 's'){
    paddleLeft.speedY=0;
  }
}

//////////////////////////////////////////////////EDITS//////////////////////////////////////////////////

//////Eyebrow controlling right hand side//////
void oscEvent(OscMessage theOscMessage) 
{
if (theOscMessage.checkAddrPattern("/gesture/eyebrow/left")==true) 
  {
  float firstValue = theOscMessage.get(0).floatValue();
  eyebrow = firstValue; //get osc data for left eyebrow and put it into float "eyebrow"

  if (eyebrow > 7 && eyebrow < 8.5){  //anywhere from 7.001 to 8.49 neutral
    paddleRight.speedY=0; // neutral
    
    } else if (eyebrow < 7) { // below 7 frown
      paddleRight.speedY=4; //frown
    
      } else if (eyebrow > 8.5) { //above 8.5 raise
        paddleRight.speedY=-4; //raise 
        }
delay(15);
  }
}


/////shiftr.io controlling left side//////
void clientConnected() 
{
  println("client connected");
  client.subscribe("/pong");
}

void messageReceived(String topic, byte[] payload) { 

   {
          Rval = int(new String(payload));
    println("Rval= " + topic + " - " + Rval);
    
    if (Rval == 0){ //neutral
       paddleLeft.speedY=0;
       println("neutral");
       
    } else if (Rval == 2) { // below 7 frown
      paddleLeft.speedY=4; //frown
      println("frown");
    
      } else if (Rval == 1) { //above 8.5 raise
        paddleLeft.speedY=-4; //raise 
        println("raise");
        }
   }
}

void connectionLost() 
{
  println("connection lost");
}

//////////////////////////////////////////////////EDITS//////////////////////////////////////////////////

class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  // Constructor method
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225); 
  }
  
  void move() {
    // Add speed to location
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
  //functions to help with collision detection
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float top(){
    return y-diameter/2;
  }
  float bottom(){
    return y+diameter/2;
  }

}




class Paddle{

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  
  Paddle(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }

  void move(){
    y += speedY;
    x += speedX;
  }

  void display(){
    fill(c);
    rect(x-w/2,y-h/2,w,h);
  } 
  
  //helper functions
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}
