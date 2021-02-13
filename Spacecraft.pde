
class spacecraft{
  color c = color(255,0,50);
  color l = color(28,255,0);
  int team = 1;
  int dead = 0;
  float xpos;
  float ypos;
  float speed = 5;
  PShape body;
  PShape l_gun;
  PShape r_gun;
  PShape spacecraft;
  
  spacecraft(float x,float y){
      
      xpos = x;
      ypos = y;
    
      // create spacecraft
      fill(c);
      stroke(0);
      body = createShape();
      body.beginShape();
      body.vertex(0,0);
      body.vertex(25,40);
      body.vertex(0,25);
      body.vertex(-25,40);
      body.endShape(CLOSE);
      
      
      fill(255);
      noStroke();
      r_gun = createShape();
      r_gun.beginShape();
      r_gun.vertex(7,15);
      r_gun.vertex(10,15);
      r_gun.vertex(10,10);
      r_gun.vertex(13,10);
      r_gun.vertex(13,15);
      r_gun.vertex(16,15);
      r_gun.vertex(16,30);
      r_gun.vertex(7,25);
      r_gun.endShape(CLOSE);
      
      l_gun = createShape();
      l_gun.beginShape();
      l_gun.vertex(-7,15);
      l_gun.vertex(-10,15);
      l_gun.vertex(-10,10);
      l_gun.vertex(-13,10);
      l_gun.vertex(-13,15);
      l_gun.vertex(-16,15);
      l_gun.vertex(-16,30);
      l_gun.vertex(-7,25);
      l_gun.endShape(CLOSE);
      
      spacecraft = createShape(GROUP);
      spacecraft.addChild(l_gun);
      spacecraft.addChild(r_gun);
      spacecraft.addChild(body);
      
  }
  
  void display(){
    shape(spacecraft,xpos,ypos);
  }
  
  void move(int direction){
    
    if(direction == 1 && xpos + 25 < 700){
      xpos += speed;
    }
    
    if(direction == 2 && xpos - 25 > 0){
      xpos -= speed;
    }
    
    if(direction == 3 && ypos > 0){
      ypos -= speed;
    }
    
    if(direction == 4 && ypos + 40 < 700){
      ypos += speed;
    }
  }
  
  laser r_shoot(){
    
    laser right = new laser(l,xpos + 12,ypos + 10,team);
    
    return(right);
    
  }
  
  laser l_shoot(){
    
    laser left = new laser(l,xpos - 12,ypos + 10,team);
    
    return(left);
  }
  
  int checkDeath(float x, float y){
    
    if(xpos + 15 > x - 3 && xpos - 15 < x + 27 && dead == 0){
      if(ypos < y - 25){
        dead = 1;
      }
    }
    return dead;
  }
  
  void explode(PImage exp){
    image(exp,xpos - 50,ypos - 50);
  }

}