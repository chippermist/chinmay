void setup() {
  size(600,600);
  background(255);
}

void draw() {
  drawTree();
}

void drawTree() {
  // color to brown
  stroke(102, 51, 0);
  fill(102, 51, 0);
  rect(width/2-25, height/1.5, width/11,height);  
  
  //draw circles
  stroke(0, 102, 0);
  
}

void mouseClicked() {
  fill(0, 102, 0);
  circle(mouseX, mouseY, 150);
}

void keyPressed() {
  if(key == ' ') {
     save("lone_tree.png");
  }
}
