Flower[] flowerRow = new Flower[6];  // the first instance of the Flower class

void setup() {
  size(1000,1000);
  
  float r1 = 50;
  float petals = random(5, 9);
  float x = width/flowerRow.length;
  float y = height/2;
  int pc = #FFA000;

  for(int i = 0; i < flowerRow.length; i++){
    flowerRow[i] = new Flower(r1, petals, x*i+x*0.5, y, pc);
  }
}

void draw(){
  background(#43AF76);

  for (Flower i : flowerRow) {
    i.display();
  }
}
