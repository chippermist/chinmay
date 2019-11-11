import abstractShapes.library.*;

AbstractShapes aShape;

void setup() {
  size(800,800);
  aShape = new AbstractShapes(this);
  frameRate(20);
}

void draw() {
  translate(height/2, width/2);
  aShape.nestedTriangle(0, 0, 500,500, (mouseX+mouseY)/2 % 100);
}
