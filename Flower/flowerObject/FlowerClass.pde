class Flower {
  
  // Variables
  float r;                                                                     // radius of the flower petal
  float n_petals;                                                              // number of petals 
  float x;                                                                     // x-position of the center of the flower
  float y;                                                                     // y-position of the center of the flower
  int petalColor;                                                              // hexadecimal number for the color of petals
  float dx, dy;                                                                // distance change for x and y
 
  Flower(float temp_r, float temp_n_petals, float temp_x,
        float temp_y, int temp_petalColor) {
    
    r = temp_r;
    n_petals = temp_n_petals;
    x = temp_x;
    y = temp_y;
    petalColor = temp_petalColor;
    dx = random(-5, 5)*2;;
    dy = random(-5, 5)*2;;
  }

  void display () {
    
    float ballX;
    float ballY;
    
    fill(petalColor);
    for (float i=0; i<PI*2; i += 2*PI/n_petals) {
      ballX=x + r*0.9*cos(i);
      ballY=y + r*0.9*sin(i);
      ellipse(ballX,ballY,r,r); 
    }
    fill(200,0,0);
    ellipse(x,y,r*1.2,r*1.2);

    this.move();
  }

  void move() {
    x += dx;
    y += dy;

    this.bounce();
  }

  void bounce() {
    if (dist(x, y, x, 0) < 1.4*r || dist(x, y, x, height) < 1.4*r) {
      dy /= (-1);
    }

    if (dist(x, y, 0, y) < 1.4*r || dist(x, y, width, y) < 1.4*r) {
      dx /= (-1);
    }
  }
}