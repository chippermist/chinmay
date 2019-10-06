// globals
float freq = 0.02;
float rW = 120;
float rH = 120;
int count = 0;

// for external svg
PShape skull;

void setup() {
  size(800,800);
  // setting the background to black
  background(255);
  
  skull = loadShape("sugar_skull.svg");
  noFill();
  stroke(0);
  
  drawForm(width/2, height/2, 300);
  //rectMode(CENTER);
  pushMatrix();
  skull.disableStyle();
  translate(width/2, height/2);
  shapeMode(CENTER);
  fill(getRandomColor(), getRandomColor(), getRandomColor());
  shape(skull, 0, 0, width/2, height/2);
  skull.enableStyle();
  noFill();
  popMatrix();
  
  drawEdges();
}

void draw() { 
}

float genRotationVal(int count) {
  float r = 0.0;
  int val = count % 0x7;
  if(val < 2) 
    r = 0;
  else if(val < 4) 
    r = PI/4;
  else if(val < 6) 
    r = PI/2;
  else 
    r = PI;
    
  return r;
}

int getRandomColor() {
  return (int)Math.floor(Math.random() * Math.floor(255));
}

void drawForm(float x, float y, float changeVal) {
  drawShape(x, y, changeVal);
  
  if(changeVal > 40) {
    drawForm(x + changeVal*PI, y, changeVal*0.65);
    drawForm(x, y + changeVal*PI, changeVal*0.65);
    drawForm(x, y - changeVal*PI, changeVal*0.65);
    drawForm(x - changeVal*PI, y, changeVal*0.65);
    count++;
    println(count);
  }
}

void drawShape(float x, float y, float changeVal) {
  pushMatrix();
  translate(x+rW/2, y+rH/2);
  float rotationVal = genRotationVal(count);
  //scale(changeVal/PI);
  //rotate(rotationVal);
  //rectMode(CENTER);
  noFill();
  
  //pushMatrix();
  //skull.disableStyle();
  //rotate(radians(0));
  //fill(0, 102, 153);
  //shape(skull, 0, 0, rW/2, rH/2);
  //skull.enableStyle();
  //popMatrix();
  
  pushMatrix();
  noFill();
  rotate(rotationVal);
  line(0,0, rW/x*PI, rH/y*PI);
  ellipse(0,0,200*rotationVal, 20);
  popMatrix();
  
  popMatrix();
}

void drawEdges() {
  int fillColorR = getRandomColor();
  int fillColorB = getRandomColor();
  int fillColorG = getRandomColor();
  fill(fillColorR, fillColorB, fillColorG);
  ellipseMode(CENTER);
  translate(0, 0);
  // top left
  pushMatrix();
  arc(0, 0, 100, 100, radians(0), radians(90));
  popMatrix();
  
  // top right
  pushMatrix();
  arc(width, 0, 100, 100, radians(90), radians(180));
  popMatrix();
  
  // bottom left
  pushMatrix();
  arc(0, height, 100, 100, radians(270), radians(360));
  popMatrix();
  
  // bottom right
  pushMatrix();
  arc(width, height, 100, 100, radians(180), radians(270));
  popMatrix();
}
