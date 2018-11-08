class Block {
  
  // Init vars
  int w = 100;
  int h = 20;
  float sub = 0;
  float speed = 0.3;
  int row, col, type, hits;
  color[] types = {#AEC16E, #88A3CB, #8E4B43};
  color[] typesActive = {#7D894F, #677A95, #5A302B};
  boolean last = false;
  
  Block(int setCol, int setRow, int setType, float setSpeed){
    row = setRow;
    col = setCol;
    type = setType;
    speed = setSpeed;
  }
  
  boolean render(float setPlayerX){
    int playerX = int((setPlayerX-(setPlayerX%w))/w);
    fill(types[type]);
    if(playerX == this.col && this.last == true) {
      fill(typesActive[type]);
    }
    stroke(#EEEEEE);
    strokeWeight(2);
    rectMode(CORNER);
    rect(w*col, h*row+sub, w, h, 3);
    sub += speed;
    if (h*row+sub >= 580-h) {
      return false;
    } else {
      return true;
    } 
  }
}
