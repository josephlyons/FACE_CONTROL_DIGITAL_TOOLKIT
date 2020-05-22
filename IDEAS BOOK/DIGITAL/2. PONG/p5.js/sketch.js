/// With credit to One Man Army Studios, Kyle Mcdonald and thanks to Daniel Shiffman.
/// This project is basically a frankenstien of OMAS & Kyle's code.
/// All of this made possible by tutorials from The Code Train/Daniel Shiffman.

var player1, ball, ai;

var player1Score = 0;
var AIScore = 0;
var dots = [];
var dSize = 10;
var txtSize = 20;

var go = false;

var capture; ////eyebrow shit
var tracker //// eyebrow shit
var w = 800;
var h = 500;

var highThres = 24;
var lowThres = 19;

var col = 0;

var canvas;
var h1;
var p1;

function setup() {
  h1 = createElement('h1', 'EYEBROW PONG');
  p1 = createElement('p', 'by joseph lyons ///// www.josephlyons.info');
  canvas = createCanvas(w, h);
  
  capture = createCapture({
    audio: false,
    video: {
        width: w,
        height: h,
    }
  }, function() {
    console.log('capture ready.');
  });
capture.elt.setAttribute('playsinline', '');
capture.size(w, h);
capture.hide();

  player1 = new Player1();
  ai = new AI();
  ball = new Ball();

  for(let y = dSize/2; y<height; y+=dSize*2){
    dots.push(createVector(width/2-dSize/2, y));
  }

  colorMode(HSB);
  tracker = new clm.tracker();
  tracker.init();
  tracker.start(capture.elt);
}


function draw() { 
    canvas.position(windowWidth/2 - w/2, 200);
    h1.position(windowWidth/2 - 80, 30);
    p1.position(windowWidth/2 - 150, 100);

  image(capture, 0, 0, 800, 500);
  var positions = tracker.getCurrentPosition();
 
  noFill();
  stroke(255);
  beginShape();
  for (var i = 0; i < positions.length; i++) {
      vertex(positions[i][0], positions[i][1]);
  }
  endShape();
 
//  noStroke();
//  for (var i = 0; i < positions.length; i++) {
      fill(map(i, 0, positions.length, 0, 360), col, 100);
//      ellipse(positions[i][0], positions[i][1], 4, 4);
//      text(i, positions[i][0], positions[i][1]);
//  }
 
  
  if (positions.length > 0) {
   var eye = createVector(positions[29][0], positions[29][1]);
   var eyebrow = createVector(positions[17][0], positions[17][1]);
   var EBheight = eye.dist(eyebrow);
  //  fill(70);
    noStroke()
    
    rect(20,20, EBheight * 3, 20);
  // print(EBheight); // highest point = 38, lowest point = 20
  }

  if(EBheight > highThres){ // key w
    player1.up();
    col = 50;
  } else if (EBheight <lowThres){ //key s
    player1.down();
    col = 50;
  } else if (EBheight < highThres || EBheight > lowThres){
    player1.stop();
    col = 0;
  }

  if(go){
    ball.edges();
    ball.update();
    player1.update();
    ai.update();
    ball.scores();
  }

  noStroke();
  fill(255, 100);
  drawSquares();

  ball.show();
  player1.show();
  ai.show();
  drawScores();
}

function drawScores(){
  let x1 = width/4
  let x2 = width*3/4;
  let y = txtSize*1.5;

  noStroke();
  fill(255);
  textAlign(CENTER);
  textSize(txtSize);
  text(player1Score, x1, y);
  text(AIScore, x2, y);
}

function drawSquares(){
  for(let i = 0; i<dots.length; i++){
    let x = dots[i].x;
    let y = dots[i].y;

    rect(x, y, dSize, dSize);
  }
}

  function keyPressed(){
    go = true;
    if(key == 'w' || keyCode==UP_ARROW){
      player1.up();
    } else if (key == 's' || keyCode==DOWN_ARROW)
      player1.down();
  }

  function keyReleased(){
    if((key == 'w' || keyCode==UP_ARROW) || (key == 's' || keyCode==DOWN_ARROW)) {
      player1.stop();
    }
  }
