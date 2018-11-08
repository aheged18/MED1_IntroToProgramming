class Shooter {
  
  // Init vars
  float x = 500;
  int y = 590;
  int w = 75;
  int h = 10;
  int step = 10;
  
  void render(){
    fill(0, 0, 0, 100);
    rectMode(CENTER);
    rect(x, y, w, h, 5);
  }
}
