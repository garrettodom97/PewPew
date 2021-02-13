
class enemy1{
  color c = color(0,236,255);
  color l = color(255,68,0);
  int team = 2;
  int dead = 0;
  float xpos;
  float ypos = 0;
  float speed = 5;
  PShape body;
  PShape l_wing;
  PShape r_wing;
  PShape gun;
  PShape enemy1;
  
  enemy1(float x){
    
    xpos = x;
    
    fill(c);
    noStroke();
    body = createShape();
    body.beginShape();
    body.vertex(-15,-20);
    body.vertex(15,-20);
    body.vertex(15,0);
    body.vertex(-15,0);
    body.endShape(CLOSE);
    
    r_wing = createShape();
    r_wing.beginShape();
    r_wing.vertex(15,0);
    r_wing.vertex(15,-30);
    r_wing.vertex(25,-30);
    r_wing.vertex(25,-22);
    r_wing.endShape(CLOSE);
    
    l_wing = createShape();
    l_wing.beginShape();
    l_wing.vertex(-15,0);
    l_wing.vertex(-15,-30);
    l_wing.vertex(-25,-30);
    l_wing.vertex(-25,-22);
    l_wing.endShape(CLOSE);
    
    fill(255);
    gun = createShape();
    gun.beginShape();
    gun.vertex(-3,0);
    gun.vertex(-3,6);
    gun.vertex(-1,6);
    gun.vertex(-1,8);
    gun.vertex(1,8);
    gun.vertex(1,6);
    gun.vertex(3,6);
    gun.vertex(3,0);
    gun.endShape(CLOSE);
    
    enemy1 = createShape(GROUP);
    enemy1.addChild(l_wing);
    enemy1.addChild(r_wing);
    enemy1.addChild(gun);
    enemy1.addChild(body);
    
  }
  
  void display(){
    shape(enemy1,xpos,ypos);
  }
  
  void move(){
    ypos += speed;
  }
  
  laser shoot(){
    laser beam = new laser(l,xpos,ypos + 33,team);
    return beam;
  }
  
  int checkDeath(float x, float y){
    
    if(xpos + 25 > x - 3 && xpos - 25 < x + 27 && dead == 0){
      if(ypos > y - 25){
        dead = 1;
      }
    }
    return dead;
  }
  
  void explode(PImage exp){
    image(exp,xpos - 50,ypos - 50);
  }
  
}