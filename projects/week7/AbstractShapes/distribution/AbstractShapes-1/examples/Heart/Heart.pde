import abstractShapes.library.*;

AbstractShapes aShape;

void setup() {
  size(800,800);
  aShape = new AbstractShapes(this);
  frameRate(20);
}

void draw() {
  translate(height/2, width/2);
  stroke(255,0,0);
  strokeWeight(20);
  aShape.heart();
}
