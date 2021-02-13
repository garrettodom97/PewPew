
class enemy2{
  
  color c = color(255,0,192);
  color l = color(24,0,255);
  int team = 2;
  int hit = 0;
  int dead = 0;
  float xpos = 350;
  float ypos = 0;
  float speed = 1;
  PShape body;
  PShape l_gun;
  PShape ll_gun;
  PShape r_gun;
  PShape rr_gun;
  PShape enemy2;
  
  enemy2(){
    
    fill(c);
    stroke(0);
    body = createShape();
    body.beginShape();
    body.vertex(0,0);
    body.vertex(100,-200);
    body.vertex(-100,-200);
    body.endShape(CLOSE);
    
    fill(255);
    ll_gun = createShape();
    ll_gun.beginShape();
    ll_gun.vertex(-75,-150);
    ll_gun.vertex(-65,-130);
    ll_gun.vertex(-65,-110);
    ll_gun.vertex(-75,-110);
    ll_gun.endShape(CLOSE);
    
    l_gun = createShape();
    l_gun.beginShape();
    l_gun.vertex(-35,-70);
    l_gun.vertex(-25,-50);
    l_gun.vertex(-25,-30);
    l_gun.vertex(-35,-30);
    l_gun.endShape(CLOSE);
    
    r_gun = createShape();
    r_gun.beginShape();
    r_gun.vertex(35,-70);
    r_gun.vertex(25,-50);
    r_gun.vertex(25,-30);
    r_gun.vertex(35,-30);
    r_gun.endShape(CLOSE);
    
    rr_gun = createShape();
    rr_gun.beginShape();
    rr_gun.vertex(75,-150);
    rr_gun.vertex(65,-130);
    rr_gun.vertex(65,-110);
    rr_gun.vertex(75,-110);
    rr_gun.endShape(CLOSE);
    
    enemy2 = createShape(GROUP);
    enemy2.addChild(body);
    enemy2.addChild(ll_gun);
    enemy2.addChild(l_gun);
    enemy2.addChild(r_gun);
    enemy2.addChild(rr_gun);
    
  }
  
  void display(){
    shape(enemy2,xpos,ypos);
  }
  
  void move(){
    ypos += speed;
  }
  
  laser ll_shoot(){
    laser beam = new laser(l,xpos - 70,ypos - 85,team);
    return beam;
  }
  
  laser l_shoot(){
    laser beam = new laser(l,xpos - 30,ypos - 5,team);
    return beam;
  }
  
  laser r_shoot(){
    laser beam = new laser(l,xpos + 30,ypos - 5,team);
    return beam;
  }
  
  laser rr_shoot(){
    laser beam = new laser(l,xpos + 70,ypos - 85,team);
    return beam;
  }
  
  int checkHit(float x, float y){
    
    if(xpos + 100 > x - 3 && xpos - 100 < x + 3 && dead == 0){
      if(ypos > y - 25){
        hit += 1;
        return 1;
      }
    }
    return 0;

  }
  
  int checkDeath(){
    if(hit >= 4){
      dead = 1;
    }
    return dead;
  }
  
  void explode(PImage exp){
    image(exp,xpos - 50,ypos - 50);
  }
  
  
}