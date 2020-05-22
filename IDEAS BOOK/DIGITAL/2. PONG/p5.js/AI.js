function AI(){
    this.w = 15;
    this.h = 80;
    this.pos = createVector(width-this.w*3, height/2-this.h/2);
    this.aiLevel = 0.856;
    this.acc = createVector(0, 0);
    //this.spd = 10;
    //this.maxSpd = 10;

    this.show = function(){
        noStroke();
        fill(255);
        rect(this.pos.x, this.pos.y, this.w, this.h)
    }

    this.update = function(){
        if(ball.pos.x > w/2){
        this.pos.y = (ball.pos.y - (this.h/2)) * this.aiLevel;
        }


     //   if(ball.pos.y<this.pos.y-this.h/2){
     //       this.acc.y-=this.spd;
     //   } else{
     //       this.acc.y+=this.spd;
     //   }
     //   this.acc.y = constrain(this.acc.y, -this.maxSpd, this.maxSpd);

        this.pos.add(this.acc);
        this.pos.y = constrain(this.pos.y, 0, height-this.h);
    }
}