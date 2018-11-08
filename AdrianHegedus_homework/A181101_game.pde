Block[][] blocks = new Block[10][10];
Shooter player = new Shooter();
int col, row, generated;
int score = 0;
int winstatus = 2;
float initSpeed = 0.3;
float currSpeed = 0.3;

void setup() {
  size(1000,600);
  setupBlocks(initSpeed);
}

void draw() {
  background(#EEEEEE);
  textAlign(LEFT, BOTTOM);
  fill(100, 100, 100);
  text("Score: " + str(score), 20, 580);
  
  switch(winstatus) {
    case 0:
      // Render blocks
      for(col = 0; col < blocks.length; col++) {
        for(row = 0; row < blocks[col].length; row++) {
          if(blocks[col][row] != null) {
            if(blocks[col][row].render(player.x) == false){
               winstatus = -1;
            }
          }
        }
      }
      player.render();
      break;
    case 1:
      textAlign(CENTER, CENTER);
      text("You won!\nPress Enter to play again.", width/2, height/2);
      break;
    case -1:
      textAlign(CENTER, CENTER);
      text("You lost!\nPress Enter to try again.", width/2, height/2);
      break;
    case 2:
      textAlign(CENTER, CENTER);
      text("Press LEFT arrow key to move left\nPress RIGHT key to move right\nPress SPACEBAR to shoot\nor press Enter to reset\n\nYou get points for shooting the tabs, but lose points if you miss.\n\nMoving too far to the right will spawn you on the left and vice versa.", width/2, height/2);
      break;
  }
}

void setupBlocks(float speed) {  
  for(col = 0; col < blocks.length; col++) {
    for(row = 0; row < blocks[col].length; row++) {
      int gen = int(random(1.1) > 0.6);
      int type = int(random(3));
      if(gen == 1){
        blocks[col][row] = new Block(col, row, type, speed);
        generated = row;
      } else {
        blocks[col][row] = null;
      }
    }
    if (generated != -1){
      blocks[col][generated].last = true;
    }
    generated = -1;
  }
}

void shotProcessing(float shotX) {
  int w = 100;
  int lowest;
  shotX = (shotX-(shotX%w))/w;
  
  lowest = checkLowest(int(shotX));
  
  if(lowest != -1) {
    if(blocks[int(shotX)][lowest].type != 0){
      blocks[int(shotX)][lowest].type -= 1;
    } else {
      blocks[int(shotX)][lowest] = null;
      checkBlocks();
      checkLowest(int(shotX));
    }
    
    score += 1;
  } else {
    score -= 1;
  }
}

int checkLowest(int setCol){
  int lowest = -1;
  int col = setCol;
  
  for(int row = 0; row < blocks[col].length; row++) {
    if(blocks[col][row] != null) {
      lowest = row;
    }
  }
  if(lowest != -1){
    blocks[col][lowest].last = true;
  }
  
  return lowest;
}

void keyPressed() {
  switch(keyCode) {
    case LEFT:
      if (player.x >= -player.w){
        player.x -= player.step;
      } else {
        player.x = width;
      }
      break;
    case RIGHT:
      if (player.x <= width){
        player.x += player.step;
      } else {
        player.x = -player.w;
      }
      break;
    case ' ':
      shotProcessing(player.x);
      break;
    case ENTER:
      for(col = 0; col < blocks.length; col++){
        for(row = 0; row < blocks[col].length; row++){
          blocks[col][row] = null;
        }
      }
      
      if(winstatus == 1) {
        currSpeed += 0.1;
        setupBlocks(currSpeed);
      } else {
        score = 0;
        setupBlocks(initSpeed);
      }
      winstatus = 0;
      break;
  }
}

void checkBlocks() {
  boolean cleared = true;
  
  for(col = 0; col < blocks.length; col++){
    for(row = 0; row < blocks[col].length; row++){
      if(blocks[col][row] != null) {
        cleared = false;
        break;
      }
    }
  }
  
  if(cleared == true) {
    winstatus = 1;
  }
}
