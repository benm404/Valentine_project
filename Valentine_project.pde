import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer ap;
AudioBuffer ab;



// What is love to me: Music

void setup() {
  size(500, 500);

  minim = new Minim(this);
  ap = minim.loadFile("junkie.mp3", 1024);
  ap.play();
  ab = ap.mix;
  
  lerpav = average;
  
  rectMode(CENTER);
}

float average;
float lerpav;

void draw() {
  background(50);
  int scale = width/5;
  int scale1 = height/5;
  int cols = width/scale;
  int rows = height/scale1;
  
  
  float total = 0;
  
  for(int i = 0; i < ab.size(); i++){
    total += abs(ab.get(i));
    
  }
  
  average = total / (float)ab.size();
  lerpav = lerp(lerpav, average, 0.1f);
  float size = map(lerpav, 0, 1, 50, 150);
  float size1 = map(lerpav, 0, 1, 0.7, 1.6);
  

  
  
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      int x = 50*width/500+(i*scale);
      int y = 50*height/500+(j*scale);
      
      boombox(x, y, size1*50);
    }
  }
  
    headphones(size, width/2, height/2);
  
  println(size1);
}

void headphones(float s, int x, int y){
  stroke(0, 200, 255);
  strokeWeight(2);
  noFill();
  arc(x, y, s*width/233.333, s*width/200, PI, TWO_PI);
  fill(0);
  arc(x-width/5*s/100, y, s*width/600, s*width/600, HALF_PI, HALF_PI*3, CHORD);
  arc(x+width/5*s/100, y, s*width/600, s*width/600, -HALF_PI, HALF_PI, CHORD);
}

void boombox(int x, int y, float l){
  //int l = 50;
  int r = 5;
  stroke(0);
  fill(30);
  rectMode(CENTER);
  rect(x, y, (l*1.5)*width/500, l*width/500, r, r, r, r);
  fill(60);
  rect(x, y-width/100*l/50, (l/(10/3))*width/500, (l/5)*width/500, r, r, r, r);
  rect(x, y+width/100*l/50, (l/(10/3))*width/500, (float)(l/20)*width/500, r, r, r, r);
  stroke(100);
  circle((float)x-width/(200/9)*l/50, y, (float)(l/2.5)*width/500);
  circle(x+width/(200/9)*l/50, y, (float)(l/2.5)*width/500);
}
