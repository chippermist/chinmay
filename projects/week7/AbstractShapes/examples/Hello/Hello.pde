
import abstractShapes.library.*;

AbstractShapes hello;

void setup() {
  //size(400,400, P3D);
  smooth();
  
  hello = new AbstractShapes(this);
  
  PFont font = createFont("",40);
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  text(hello.printHelloWorld(), 40, 200);
}

void settings() {
  size(400,400);
}
