import landscapemaker.library.*;

Trees t;
int L;
PImage backg;
PImage bird;

void setup() {
  size(800,800);
  //background(255);
  backg = loadImage("back.png");
  bird = loadImage("bird.png");
  background(backg);
  
  t = new Trees(this);
  L=(int)(height*.25);
}

void draw() {
  background(backg);
  //pushMatrix();
  //scale(0.08);
  ////image(bird, 40, 40);
  ////image(bird, 43, 56);
  ////image(bird, 125, 75);
  ////image(bird, 175, 70);
  ////image(bird, 250, 200);
  ////image(bird, 400, 300);
  ////image(bird, 760, 275);
  //popMatrix();
  //translate(width/2, height*.825);
  t.tree(400,height*1, L, -90, L);
  t.tree(300,height*1.5, L, -90, L);
  t.tree(350,height*1, L, -90, L);
  t.tree(600,height*1.3, L, -90, L);
  t.tree(500,height*1.1, L, -90, L);
  t.tree(700,height*1, L, -90, L);
  noLoop();
}

void mousePressed(){
  redraw();
}

void keyPressed() {
  if ( key == ' ' ){
    save("tree.png");
  }
}
