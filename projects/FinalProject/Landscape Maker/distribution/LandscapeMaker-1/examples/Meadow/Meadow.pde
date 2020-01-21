import landscapemaker.library.*;

Trees t;
void setup() {
  size(900,800);
  
  ////background
  background(250, 250, 180);
  noStroke();

  fill(250, 250, 120);
  quad(0, 220, 900, 220, 900, 180, 0, 180);
  fill(250, 250, 150);
  quad(0, 180, 900, 180, 900, 130, 0, 130);
  fill(250, 250, 160, 80);
  quad(0, 130, 900, 130, 900, 100, 0, 100);

  // getting the current second for some random value
  int s=second();
  
  // Draw the sun
  fill(250, 190, -10);
  ellipse(460, 220+2*s, 500, 500);
  fill(250, 190, -10, 50);
  ellipse(460, 220+2*s, 550, 550);
  fill(250, 190, -10, 40);
  ellipse(460, 220+2*s, 620, 620);
  
  // water
  fill(72, 187, 232, 80);
  rect(0, 400, width, height); 
  
  // instantiate an object for Trees
  t = new Trees(this);
  
  // Draw the tree
  t.grass(400, 500, 198, 52, 400);
  save("meadow" + day()+month()+year()+hour()+second()+ ".png");
}
