import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class A181116_trailAssignment extends PApplet {

// Init vars
int num = 50;
Tbt[] objects = new Tbt[num];
int i = 0;

public void setup() { 
  
  noStroke();

  // Create "blank" objects
  for(int f = 0; f < num; f++) {
    objects[f] = new Tbt(PApplet.parseInt(random(width)), PApplet.parseInt(random(height)));
  }
}

public void draw() {
  background(0);

  // Append new positions, make sure i doesn't go out of array range
  objects[i] = new Tbt(mouseX, mouseY);
  i++;
  if(i % num == 0) {
    i = 0;
  }

  // Render objects
  for(int j = 0; j < num; j++){
    objects[(i+j)%num].render(j);
  }
}
class Tbt{

  // Init vars
  int x = 0;
  int y = 0;
  int diameterValue = 20;
  int type = PApplet.parseInt(random(4));
  int r = randomizeColor();
  int g = randomizeColor();
  int b = randomizeColor();  

  Tbt(int setX, int setY) {
    x = setX;
    y = setY;
  }

  public void render(int j) {
    j += diameterValue;
    fill(r, g, b, 150);

    switch (type) {
      case 1 :
        ellipse(x, y, j, j);
      break;
      case 2 :
        rectMode(CENTER);
        rect(x, y, j, j);
      break;
      case 3 :
        triangle(x, y-(j/2), x+(j/2), y+(j/2), x-(j/2), y+(j/2));
      break;	
    }
  }

  // Return-type function to make 64 possible color combinations
  public int randomizeColor() {
    int value = PApplet.parseInt(random(4))*64;
    return value;
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A181116_trailAssignment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
