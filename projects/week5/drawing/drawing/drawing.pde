import drawing.library.*;
import processing.pdf.*;
import controlP5.*;

DrawingManager drawingManager;
ControlP5 cp5;
int selection = 0;
float R = 0, G = 0, B = 0;
float size = 30;
Controller RSlider, BSlider, GSlider, sizeSlider;
boolean reflect = false;
ArrayList<DShape> shapes = new ArrayList<DShape>();

void setup() {
  size(1024, 768, P3D);
  background(255);
  smooth();
  cp5 = new ControlP5(this);
  drawingManager = new DrawingManager(this);
  
  RSlider = cp5.addSlider("R")
            .setPosition(25, 25)
            .setRange(0, 255);
            
  BSlider = cp5.addSlider("B")
            .setPosition(25, 25*2)
            .setRange(0, 255);
            
  GSlider = cp5.addSlider("G")
            .setPosition(25, 25*3)
            .setRange(0, 255);
            
  sizeSlider = cp5.addSlider("size")
            .setPosition(25, 25*4)
            .setRange(0, 255);
}

void draw() {
}

void keyPressed() {
  // clear the screen
  if(key == 'c') {
    drawingManager.clear();
  }
  
  // save a PDF
  if(key == ' ') {
    drawingManager.savePDF();
  }
  
  // change shape
  if(key == 't') {
    selection = 1;
  } else if(key == 'k') {
    selection = 2;
  } else {
    selection = 0;
  }
  
  // set the background color
  if(key == 'b') {
    background(R, B, G);
  }
  
  // start reflection mode
  if(key == 'r') {
    reflect = reflect == true ? false : true;
  }
}

void mousePressed() {
  shapes.clear();
  DShape s1 = drawingManager.addShape();
  shapes.add(s1);
  if(reflect) {
    DShape s2 = drawingManager.addShape();
    shapes.add(s2);
    s2.translate(width, 0);
    s2.scale(-1,1);
  }
}

void mouseDragged() {
  switch(selection) {
    case 0:
      stroke(R, B, G);
      drawingManager.stroke((int)R, (int)B, (int)G);
      DShape s1 = shapes.get(0);
      s1.addVertex(mouseX,mouseY);
      if(reflect) {
        DShape s2 = shapes.get(1);
        s2.addVertex(mouseX, mouseY);
      }
      break;
    case 1:
      //translate(mouseX,mouseY);
      stroke(R, B, G); 
      drawingManager.stroke((int)R,(int)B, (int)G);
      drawingManager.triangle(mouseX,mouseY,mouseX-size,mouseY+size,size,size);
      break;
    case 2:
      //translate(mouseX, mouseY);
      stroke(R, B, G); 
      drawingManager.stroke((int)R,(int)B, (int)G);
      drawingManager.ellipse((float)mouseX, (float)mouseY, size, size);
      break;
  }
  
  // TODO: get the reflection to work for all shapes

}
