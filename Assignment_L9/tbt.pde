class Tbt{

  // Init vars
  int x = 0;
  int y = 0;
  int diameterValue = 20;
  int type = int(random(4));
  int r = randomizeColor();
  int g = randomizeColor();
  int b = randomizeColor();  

  Tbt(int setX, int setY) {
    x = setX;
    y = setY;
  }

  void render(int j) {
    j += diameterValue;
    fill(r, g, b, 150);

    // if 1 do this, elseif 2 do that..
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

  // Return-type function to make 512 (8^3) possible color combinations
  int randomizeColor() {
    int value = int(random(8))*32;
    return value;
  }
}
