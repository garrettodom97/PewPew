
class laser{
  color c;
  PShape beam;
  float xpos;
  float ypos;
  float speed;
  int team;
  
  laser(color z,float x, float y, int b){
    
    xpos = x;
    ypos = y;
    c = z;
    team = b;
    
    if(team == 1){
      speed = 10;
    }
    
    if(team == 2){
      speed = 7;
    }
    
    fill(c);
    noStroke();
    beam = createShape();
    beam.beginShape();
    beam.vertex(-3,-25);
    beam.vertex(3,-25);
    beam.vertex(3,0);
    beam.vertex(-3,0);
    beam.endShape();
    
  }
  
  void display(){
    shape(beam,xpos,ypos);
  }
  
  void move(){
    
    if(team == 1){
      ypos -= speed;
    }
    
    if(team == 2){
      ypos += speed;
    }
    
  }
  
}