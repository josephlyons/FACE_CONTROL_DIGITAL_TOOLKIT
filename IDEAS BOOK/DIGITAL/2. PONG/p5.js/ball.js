function Ball(){
    this.pos = createVector(width/2, height/2);
    this.r = 10;
    this.maxSpd = createVector(15,15);
    this.collision = false;
    this.collObj = null;

    do{
    this.acc = p5.Vector.random2D();
    this.acc.setMag(random(4,6));
    }while(abs(this.acc.x)<3 || abs(this.acc.y)<3);

    this.show = function(){
        noStroke();
        fill(255);
        ellipse(this.pos.x, this.pos.y, this.r*2);
    }

    this.update = function(){
        this.pos.add(this.acc);

        if(this.pos.y<this.r || this.pos.y>height-this.r){
            this.acc.y*=-1;
        }
    }

    this.edges = function(){
        let collided = false;
        let obj;
        let d1, d2;

        for(let i = 0; i<ai.h; i++){
            d1 = dist(this.pos.x, this.pos.y, ai.pos.x, ai.pos.y+i);
            d2 = dist(this.pos.x, this.pos.y, player1.pos.x+player1.w, player1.pos.y+i);

            if(d1<=this.r){
                collided = true;
                obj = ai;
                break;
            }else if(d2<=this.r){
                collided = true;
                obj = player1;
                break;
            }
        }
    
        if(collided && !this.collision){
            this.collision = true;
            this.collObj = obj;

            this.acc.add(createVector(0.5, obj.acc.y*0.25));
            this.acc.x *= -1;
            this.acc.x = constrain(this.acc.x, -this.maxSpd.x, this.maxSpd.x);
            this.acc.y = constrain(this.acc.y, -this.maxSpd.y, this.maxSpd.y);
        }else if(this.collObj){
            let d = dist(this.pos.x, this.pos.y, this.collObj.pos.x, this.collObj.pos.y)
            if(d>100){this.collision = false;}
        }
    }

    this.scores = function(){
        if(this.pos.x<this.r){
            AIScore++;
            this.res();
        }else if(this.pos.x>width+this.r){
            player1Score++;
            this.res();
        }
    }

    this.res = function(){
        go = false;
        ai.pos = createVector(width-ai.w*3, height/2-ai.h/2);
        player1.pos = createVector(player1.w*2, height/2-player1.h/2);

        this.pos  = createVector(width/2, height/2);

        do{
            this.acc = p5.Vector.random2D();
            this.acc.setMag(random(4,6));
        }while(abs(this.acc.x)<3 || abs(this.acc.y)<3);
        
    }
}