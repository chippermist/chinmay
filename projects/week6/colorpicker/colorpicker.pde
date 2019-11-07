import drawing.library.*;
import processing.pdf.*;
import controlP5.*;

// globals 
DrawingManager dManager;
ControlP5 cp5;
int R=255, G=255, B=255;
ArrayList<DShape> shapes = new ArrayList<DShape>();
CheckBox checkBox;
int size = 20;

Swatch swatch;
Swatch selectedSwatch;
ArrayList<Swatch> swatches;


void setup() { //<>//
  size(800,800);
  background(255);
  smooth();
  frameRate(30);
  cp5 = new ControlP5(this);
  dManager = new DrawingManager(this);
  
  checkBox = cp5.addCheckBox("checkBox")
          .setPosition(25, 25)
          .setSize(40, 40)
          .setItemsPerRow(4)
          .setSpacingColumn(30)
          .showLabels()
          .setColorLabel(color(0))
          .addItem("Red", 1)
          .addItem("Green", 1)
          .addItem("Blue", 1)
          .addItem("Random", 1);
          
   swatches = new ArrayList<Swatch>();
   swatch = new Swatch(mouseX, mouseY, 20, R, G, B);
   swatch.locked = true;
   swatches.add(swatch);
}

void draw() {
  colorMode(RGB, 255);
  for(int i=0; i<swatches.size(); ++i) {
    swatches.get(i).draw();  
  }
  
}

void keyPressed() {
  // clear the screen
  if(key == 'c') {
    dManager.clear();
    swatches.clear();
    background(255);
    R=G=B=0;
    checkBox.deactivateAll();
  }
  
  // save a PDF
  if(key == ' ') {
    saveFrame();
  }
  
  // generate colors
  if(key != 'c' && key != ' ') {
    generateColors(checkBox.getState("Red"), checkBox.getState("Green"), checkBox.getState("Blue"), checkBox.getState("Random"));
  }
}

void mousePressed() {
  shapes.clear();
  DShape s1 = dManager.addShape();
  shapes.add(s1);
  
  Swatch s = checkForSwatchHit(mouseX,mouseY);
  if(s != null && s.locked){
     s.selected = true;
    selectedSwatch = s;
  }
}

void mouseDragged() {
  dManager.stroke(R, G, B);
  DShape s1 = shapes.get(0);
  dManager.fill(R, G, B);
  //dManager.ellipse(mouseX, mouseY, size, size);
  s1.addVertex(mouseX, mouseY);
  
  
  // printing the current RGB value
  println(R, G, B);
}

void mouseClicked(MouseEvent evt) {
  if (evt.getCount() == 2){
    Swatch s = checkForSwatchHit(mouseX,mouseY);
    if(s != null){
      s.locked = true;
      s.rad = 40;
    }
  }
}

Swatch checkForSwatchHit(int x,int y){
   for(int i=swatches.size()-1;i>=0;i--){
   Swatch s = swatches.get(i);
   boolean hitTest = s.hitTest(x,y);
   
   if(hitTest == true){
       return s;
   }
  } 
  return null;
}

void generateColors(boolean red, boolean green, boolean blue, boolean r) {
  float dist = map(mouseX/2,0,mouseY/2,0,40);
  int newR = R, newB = B, newG = G;
  if(red) {
    newR = round(randomGaussian()*dist+R) % 255;
    //println(newR); 
  }
  if(green) {
    newG = round(randomGaussian()*dist+G) % 255;
  }
  
  if(blue) {
    newB = round(randomGaussian()*dist+B) % 255;
  }
  
  if(r) {
    newR = round(randomGaussian()*255+R) % 255;
    newG = round(randomGaussian()*255+G) % 255;
    newB = round(randomGaussian()*255+B) % 255;
  }
  
  // generating color swatches
  Swatch newSwatch = new Swatch(mouseX, mouseY, 40, newR, newB, newG);
  swatches.add(newSwatch);
  R = newR; B = newB; G = newG;

  
}
