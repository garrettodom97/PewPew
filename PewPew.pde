
// create sound files
import ddf.minim.*;

Minim minim1;
Minim minim2;
Minim minim3;
Minim minim4;
Minim minim5;

AudioPlayer music;
AudioPlayer laser;
AudioPlayer laserE;
AudioPlayer boom;
AudioPlayer laserH;

// declare game variables
PImage back;
PImage explosion;
PFont arial;
int score;
int sound = 1;
int mode = 1;
int box;
int gameOver;
int frame = 0;
int laser1 = 0;
int laser2 = 0;
int elaser1 = 0;
int elaser2 = 0;
int elaser3 = 0;
int elaser4 = 0;
int heavy1 = 0;
int heavy2 = 0;
int heavy3 = 0;
int heavy4 = 0;
int fight1 = 0;
int fight2 = 0;
int fight3 = 0;
int fight4 = 0;
int fight5 = 0;
int exp = 0;
int exp1 = 0;
int exp2 = 0;
int exp3 = 0;
int exp4 = 0;
int exp5 = 0;

// declare class instances
laser right;
laser left;
laser right2;
laser left2;
laser e1;
laser e2;
laser e3;
laser e4;
laser h1;
laser h2;
laser h3;
laser h4;
spacecraft player;
enemy1 fighter1;
enemy1 fighter2;
enemy1 fighter3;
enemy1 fighter4;
enemy2 heavy;

// variables for saving scores to text file
PrintWriter Scores;
int[] scores = {0,0,0,0,0,0,0,0,0,0};

void setup(){
  // initialize all files, fonts, etc.
  size(700,700,P3D);
  arial = createFont("Arial", 32);
  textFont(arial);
  back = loadImage("space.jpeg");
  explosion = loadImage("explosion.png");
  explosion.resize(100,0);
  
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  minim3 = new Minim(this);
  minim4 = new Minim(this);
  minim5 = new Minim(this);
  
  
  //music = minim1.loadFile("Megalovania.mp3");
  laserH = minim2.loadFile("raygun.mp3");
  laser = minim3.loadFile("laser.aiff");
  laserE = minim4.loadFile("laser2.aiff");
  boom = minim5.loadFile("explosion.aiff");
  
  String[] lines = loadStrings("Scores.txt");
  if(lines==null){
    Scores = createWriter("Scores.txt");
  }
  else{
  for (int i=0;i<(lines.length-3);i++){
    scores[i] = int(lines[i+3]);
  }
  scores = sort(scores);
  scores = reverse(scores);
  Scores = createWriter("Scores.txt");
  }
  
}

void draw(){
  
  // main menu
  if(mode == 1){
    
    gameOver = 0;
    score = 0;
    
    // title
    background(225);
    textSize(50);
    textAlign(CENTER);
    fill(2,188,65);
    text("Pew Pew",350,150);
    textSize(24);
    fill(0);
    text("A Game by Garrett Odom",350,200);
    
    // buttons
    rectMode(CORNERS);
    fill(50);
    rect(225,300,475,375);
    fill(255,0,64);
    textSize(50);
    text("Start",350,355);
    
    rectMode(CORNERS);
    fill(50);
    rect(225,400,475,475);
    fill(255,0,64);
    textSize(50);
    text("Controls",350,455);
    
    rectMode(CORNERS);
    fill(50);
    rect(225,500,475,575);
    fill(255,0,64);
    textSize(50);
    text("Exit Game",350,555);
    
    // start game button
    if(mouseX < 475 && mouseX > 225 && mouseY < 375 && mouseY > 300 && mousePressed){
      player = new spacecraft(350,650);
      reset();
      //music.play();
      mode = 2;
    }
    
    // contorls button
    if(mouseX < 475 && mouseX > 225 && mouseY < 475 && mouseY > 400 && mousePressed){
      mode = 4;
    }
    
    // exit game button
    if(mouseX < 475 && mouseX > 225 && mouseY < 575 && mouseY > 500 && mousePressed){
      Scores.println("High Scores");
      Scores.println("------------");
      Scores.println("");
      for(int i=0;i<scores.length;i++){
        Scores.println(str(scores[i]));
      }
      Scores.flush();
      Scores.close();
      exit();
    }
    
  }
  
  // game
  if(mode == 2){
  
    // only run while player hasn't lost
    if(gameOver == 0){
      
      background(0);
      image(back,0,0);
      player.display();
      
      // display enemies
      if(fight1 == 1 && fighter1.ypos <= 750){
        fighter1.display();
        fighter1.move();
        
        // enemy shoot
        if(fighter1.ypos == 50){
          e1 = fighter1.shoot();
          if(sound == 1){
            laserE.play();
            laserE.rewind();
          }
          elaser1 = 1;
        } 
      }
      else{
        fight1 = 0;
      }
      
      // display laser
      if(elaser1 == 1 && e1.ypos < 750){
        e1.display();
        e1.move();
      }
      else{
        elaser1 = 0;
      }
      
      if(fight2 == 1 && fighter2.ypos <= 750){
        fighter2.display();
        fighter2.move();
        
        if(fighter2.ypos == 50){
          e2 = fighter2.shoot();
          if(sound == 1){
            laserE.play();
            laserE.rewind();
          }
          elaser2 = 1;
        } 
      }
      else{
        fight2 = 0;
      }
      
      if(elaser2 == 1 && e2.ypos < 750){
        e2.display();
        e2.move();
      }
      else{
        elaser2 = 0;
      }
      
      if(fight3 == 1 && fighter3.ypos <= 750){
        fighter3.display();
        fighter3.move();
        
        if(fighter3.ypos == 50){
          e3 = fighter3.shoot();
          if(sound == 1){
            laserE.play();
            laserE.rewind();
          }
          elaser3 = 1;
        } 
      }
      else{
        fight3 = 0;
      }
      
      if(elaser3 == 1 && e3.ypos < 750){
        e3.display();
        e3.move();
      }
      else{
        elaser3 = 0;
      }
      
      if(fight4 == 1 && fighter4.ypos <= 750){
        fighter4.display();
        fighter4.move();
        
        if(fighter4.ypos == 50){
          e4 = fighter4.shoot();
          if(sound == 1){
            laserE.play();
            laserE.rewind();
          }
          elaser4 = 1;
        } 
      }
      else{
        fight4 = 0;
      }
      
      if(elaser4 == 1 && e4.ypos < 750){
        e4.display();
        e4.move();
      }
      else{
        elaser4 = 0;
      }
      
      // display heavy enemy
      if(fight5 == 1 && heavy.ypos <= 920){
        heavy.display();
        heavy.move();
        
        // heavy enemy shoot
        if(heavy.ypos % 150 == 0){
          h1 = heavy.ll_shoot();
          h2 = heavy.l_shoot();
          h3 = heavy.r_shoot();
          h4 = heavy.rr_shoot();
          if(sound == 1){
            laserH.play();
            laserH.rewind();
          }
          heavy1 = 1;
          heavy2 = 1;
          heavy3 = 1;
          heavy4 = 1;
        } 
      }
      else{
        fight5 = 0;
      }
      
      // heavy laser displays
      if(heavy1 == 1 && h1.ypos < 750){
        h1.display();
        h1.move();
      }
      else{
        heavy1 = 0;
      }
      
      if(heavy2 == 1 && h2.ypos < 750){
        h2.display();
        h2.move();
      }
      else{
        heavy2 = 0;
      }
      
      if(heavy3 == 1 && h3.ypos < 750){
        h3.display();
        h3.move();
      }
      else{
        heavy3 = 0;
      }
      
      if(heavy4 == 1 && h4.ypos < 750){
        h4.display();
        h4.move();
      }
      else{
        heavy4 = 0;
      }
      
      // player movement
      if(keyPressed == true){
        
        if(key == 'd' || key == 'D'){
          player.move(1);
        }
        
        if(key == 'a' || key == 'A'){
          player.move(2);
        }
        
        if(key == 'w' || key == 'W'){
          player.move(3);
        }
        
        if(key == 's' || key == 'S'){
          player.move(4);
        }
        
      }
      
      // check death of enemies from player laser1
      if(laser1 == 1 && right.ypos > 0){
        right.display();
        left.display();
        
        right.move();
        left.move();
        
        if(fight1 == 1){
          if(fighter1.checkDeath(left.xpos,left.ypos) == 1){
            fighter1.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            score += 1;
            exp1 = 5;
            fight1 = 0;
            laser1 = 0;
          }
        }
        if(fight2 == 1){
          if(fighter2.checkDeath(left.xpos,left.ypos) == 1){
            fighter2.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            score += 1;
            exp2 = 5;
            fight2 = 0;
            laser1 = 0;
          }
        }
        if(fight3 == 1){
          if(fighter3.checkDeath(left.xpos,left.ypos) == 1){
            fighter3.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            score += 1;
            exp3 = 5;
            fight3 = 0;
            laser1 = 0;
          }
        }
        if(fight4 == 1){
          if(fighter4.checkDeath(left.xpos,left.ypos) == 1){
            fighter4.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            score += 1;
            exp4 = 5;
            fight4 = 0;
            laser1 = 0;
          }
        }
        if(fight5 == 1){
          if(heavy.checkHit(left.xpos,left.ypos) == 1){
            laser1 = 0;
          }
          if(heavy.checkDeath() == 1){
            heavy.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            score += 5;
            exp5 = 5;
            fight5 = 0;
          }
        }
      }
      else{
        laser1 = 0;
      } 
      
      
      // check death of enemies from player laser2
      if(laser2 == 1 && right2.ypos > 0){
        right2.display();
        left2.display();
        
        right2.move();
        left2.move();
        
        if(fight1 == 1){
          if(fighter1.checkDeath(left2.xpos,left2.ypos) == 1){
            fighter1.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            exp1 = 5;
            fight1 = 0;
            laser2 = 0;
          }
        }
        if(fight2 == 1){
          if(fighter2.checkDeath(left2.xpos,left2.ypos) == 1){
            fighter2.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            exp2 = 5;
            fight2 = 0;
            laser2 = 0;
          }
        }
        if(fight3 == 1){
          if(fighter3.checkDeath(left2.xpos,left2.ypos) == 1){
            fighter3.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            exp3 = 5;
            fight3 = 0;
            laser2 = 0;
          }
        }
        if(fight4 == 1){
          if(fighter4.checkDeath(left2.xpos,left2.ypos) == 1){
            fighter4.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            exp4 = 5;
            fight4 = 0;
            laser2 = 0;
          }
        }
        if(fight5 == 1){
          if(heavy.checkHit(left2.xpos,left2.ypos) == 1){
            laser2 = 0;
          }
          if(heavy.checkDeath() == 1){
            heavy.explode(explosion);
            if(sound == 1){
              boom.play();
              boom.rewind();
            }
            exp5 = 5;
            fight5 = 0;
          }
        }
      }
      else{
        laser2 = 0;
      }
      
      // display explosion a few frames after enemy death
      if(exp1 > 0){
        fighter1.explode(explosion);
        exp1 -= 1;
      }
      if(exp2 > 0){
        fighter2.explode(explosion);
        exp2 -= 1;
      }
      if(exp3 > 0){
        fighter3.explode(explosion);
        exp3 -= 1;
      }
      if(exp4 > 0){
        fighter4.explode(explosion);
        exp4 -= 1;
      }
      if(exp5 > 0){
        heavy.explode(explosion);
        exp5 -= 1;
      }
      
      
      // check player death
      if(elaser1 == 1){
        if(player.checkDeath(e1.xpos,e1.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(elaser2 == 1){
        if(player.checkDeath(e2.xpos,e2.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(elaser3 == 1){
        if(player.checkDeath(e3.xpos,e3.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(elaser4 == 1){
        if(player.checkDeath(e4.xpos,e4.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(heavy1 == 1){
        if(player.checkDeath(h1.xpos,h1.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(heavy2 == 1){
        if(player.checkDeath(h2.xpos,h2.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(heavy3 == 1){
        if(player.checkDeath(h3.xpos,h3.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      if(heavy4 == 1){
        if(player.checkDeath(h4.xpos,h4.ypos) == 1){
          player.explode(explosion);
          gameOver = 1;
        }
      }
      
      if(fight5 == 0){
        frame += 1;
      }
      createEnemy();
      
      // display score
      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("Score:",650,25);
      textSize(38);
      text(score,650,60);
      
    }
    
    // game over screen
    else{
      //music.pause();
      //music.rewind();
      background(225);
      fill(255,0,40);
      textSize(50);
      textAlign(CENTER);
      text("Game Over",350,300);
      
      // buttons
      rectMode(CORNERS);
      fill(50);
      rect(225,575,475,650);
      fill(255,0,40);
      text("Main Menu",350,630);
      text("Final Score",350,150);
      text(score,350,200);
      
      // main menu button
      if(mouseX < 475 && mouseX > 225 && mouseY < 650 && mouseY > 575 && mousePressed){
        // update scores
        // update high scores
        if(score > scores[9]){
          scores = append(scores,score);
          scores = sort(scores);
          scores = reverse(scores);
          scores = shorten(scores);
        }
        mode = 1;
      }
    }
    
  }
  
  // pause menu
  if(mode == 3){
    
    // display score
    background(225);
    fill(255,0,40);
    textSize(50);
    textAlign(CENTER);
    text("Game Paused",350,350);
    textSize(32);
    text("Score",650,25);
    textSize(38);
    text(score,650,60);
    
  }
  
  // contorls page
  if(mode == 4){
    
    // display game contorls
    background(225);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Controls",350,50);
    textSize(32);
    text("W - Move Up",350,150);
    text("A - Move Left",350,200);
    text("S - Move Down",350,250);
    text("D - Move Right",350,300);
    text("Spacebar - Fire Laser",350,350);
    text("M - Mute Game Sounds",350,400);
    text("P - Pause/Resmue Game",350,450);
    
    // button
    rectMode(CORNERS);
    fill(50);
    rect(0,0,100,50);
    fill(255,0,64);
    textSize(32);
    text("Back",50,40);
    
    // back button
    if(mouseX < 100 && mouseY < 50 && mousePressed){
      mode = 1;
    }
    
  }
  
}

// function to create enemies on certain intervals
void createEnemy(){
  
  if(frame % 50 == 0 && fight1 == 0 && fight5 == 0){
    float xpos = random(30,670);
    fighter1 = new enemy1(xpos);
    fight1 = 1;
    frame += 1;
  }
  
  if(frame % 50 == 0 && fight2 == 0 && fight5 == 0){
    float xpos = random(30,670);
    fighter2 = new enemy1(xpos);
    fight2 = 1;
    frame += 1;
  }
  
  if(frame % 50 == 0 && fight3 == 0 && fight5 == 0){
    float xpos = random(30,670);
    fighter3 = new enemy1(xpos);
    fight3 = 1;
    frame += 1;
  }
  
  if(frame % 50 == 0 && fight4 == 0 && fight5 == 0){
    float xpos = random(30,670);
    fighter4 = new enemy1(xpos);
    fight4 = 1;
    frame += 1;
  }
  
  if((frame % 550 == 0 || frame % 551 == 0 || frame % 552 == 0
  || frame % 553 == 0) && fight5 == 0){
    heavy = new enemy2();
    fight5 = 1;
    frame += 4;
  }
  
}

// method to read different key presses
void keyPressed(){
  
  // spacebar to shoot
  if(keyCode == 32 && mode == 2){
    
    if(laser1 == 0){
      right = player.r_shoot();
      left = player.l_shoot();
      if(sound == 1){
        laser.play();
        laser.rewind();
      }
      laser1 = 1;  
    }
    
    if(laser2 == 0 && right.ypos < player.ypos/2){
      right2 = player.r_shoot();
      left2 = player.l_shoot();
      if(sound == 1){
        laser.play();
        laser.rewind();
      }
      laser2 = 1;  
    }
    
  }
  
  // m key to mute
  if((key == 'm' || key == 'M') && mode == 2){
    if(sound == 1){
      //music.pause();
      sound = 0;
    }
    else if(sound == 0){
      sound = 1;
      //music.play();
    }
  }
  
  // p key to pause
  if(key == 'p' || key == 'P'){
    if(mode == 2){
      //music.pause();
      mode = 3;
      sound = 0;
    }
    else if(mode == 3){
      //music.play();
      mode = 2;
      sound = 1;
    }
  }
  
}

// function to reset all necessary game variable
void reset(){
  frame = 0;
  laser1 = 0;
  laser2 = 0;
  elaser1 = 0;
  elaser2 = 0;
  elaser3 = 0;
  elaser4 = 0;
  heavy1 = 0;
  heavy2 = 0;
  heavy3 = 0;
  heavy4 = 0;
  fight1 = 0;
  fight2 = 0;
  fight3 = 0;
  fight4 = 0;
  fight5 = 0;
  exp = 0;
  exp1 = 0;
  exp2 = 0;
  exp3 = 0;
  exp4 = 0;
  exp5 = 0;
}
  


 