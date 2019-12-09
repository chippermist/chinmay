import landscapemaker.library.*;

Weather weather;
Mountains mountain;

int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

void setup() {
  size(800,800);
  background(0);
  weather = new Weather(this);
  mountain = new Mountains(this);
  stroke(255);
  smooth();
  //mountain.mountains(3);
  frameRate(5);
}

void draw() {
  background(0);
  weather.snow(100);
  mountain.mountains(200, 100, 100, 3);
  noLoop();
}

void snow() {
  for(int i=0; i<200; ++i) {
    pushMatrix();
    translate(random(width), random(height));
    scale(0.08);
    weather.snowflake();
    popMatrix();
  }
}

void mousePressed(){
  redraw();
}

void keyPressed() {
  if ( key == ' ' ){
    save("star_mountain.png");
  }
}

void mountains(int numberOfRanges) {
  long seed = 0;
    for (int line = 0; line < numberOfRanges; line++) {

      noiseSeed(seed);
      beginShape();
      vertex(0, height/2);
      for (int x = 0; x * 100 < width; x += .1) {
        vertex(x * 100, map(noise(x), 0, 1, 0, height));
      }

      vertex(width, height);
      endShape();
      seed++;
    }
}
