import landscapemaker.library.*;

Sun lm;
Mountains m;

void setup() {
  size(400,400);
  lm = new Sun(this);
  m = new Mountains(this);
  //lm.version();
}

void draw() {
  background(0);
  fill(255);
  //Sun s = lm.createSun();
  translate(width/2,height/2);
  //lm.sun("SPOKES",0.0, 0.0, 50.0);
  m.mountains(3);
  
}
