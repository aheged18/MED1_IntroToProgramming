// Init vars
int num = 50;
Tbt[] objects = new Tbt[num];
int i = 0;

void setup() { 
  size(1000, 1000);
  noStroke();

  // Create "blank" objects
  for(int f = 0; f < num; f++) {
    objects[f] = new Tbt(int(random(width)), int(random(height)));
  }
}

void draw() {
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
