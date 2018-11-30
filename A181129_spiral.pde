// INIT VARIABLES
    float ext = 0;                                                              // current spiral extension
    float theta = 1;                                                            // rotation of the spiral
    int r = 40;                                                                 // particle size
    float i;                                                                    // gradual size incrementation

void setup() {
    size(1000, 1000);
    background(#EEEEEE);
}

void draw() {
    
    // GET POLAR COORDINATES
        float x = ext * cos(theta);
        float y = ext * sin(theta);

    // DRAW THE PARTICLES
        i = ext*0.05;
        fill(random(20), random(20), random(100, 255), noise(ext)*100);
        noStroke();
        ellipse(x+width/2, y+height/2, noise(ext)*r+i, noise(ext)*r+i);        // center +/- x/y, size random acc. to noise

    // INCREMENT
        ext += 1;
        theta += 0.1;
}
