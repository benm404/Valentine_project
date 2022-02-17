import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer ap;
AudioBuffer ab;

// What is love to me

void setup() {
  size(500, 500);
  
  minim = new Minim(this);
  ap = minim.loadFile("junkie.mp3", 1024);
  ap.play();
  ab = ap.mix;
  
  lerpav = average;
}

float average;
float lerpav;

void draw() {
  background(50);
  
  float total = 0;
  
  for(int i = 0; i < ab.size(); i++){
    total += abs(ab.get(i));
    
  }
  
  average = total / (float)ab.size();
  lerpav = lerp(lerpav, average, 0.1f);
  float size = map(lerpav, 0, 1, 50, 150);
  
  headphones(size, width/2, height/2);
  boombox(width/2, height/2, 50, 5);
  
  println(lerpav);
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

void boombox(int x, int y, int l, int r){
  stroke(0);
  fill(30);
  rectMode(CENTER);
  rect(x*width/500, y*width/500, (l*1.5)*width/500, l*width/500, r, r, r, r);
}
