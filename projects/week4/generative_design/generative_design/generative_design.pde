import java.util.Calendar;
import controlP5.*;

ControlP5 cp5;
int octaves = 4;
float falloff = 0.5;
PShape hand;
int gridResolutionX, gridResolutionY;
float tileSize = 40;
Controller tileSizeSlider;

void setup() {
  size(800,800);
  cursor(HAND);
  cp5 = new ControlP5(this);
  
  tileSizeSlider = cp5.addSlider("tileSize")
          .setPosition(25, 25)
          . setRange(20, 200);
  
  
  
  smooth();
  hand = loadShape("hand.svg");
}

void draw() {
  background(255);
  noiseDetail(octaves,falloff);
  gridResolutionX = round(width/tileSize);
  gridResolutionY = round(height/tileSize);
  float noiseXRange = mouseX/100.0;
  float noiseYRange = mouseY/100.0;
  int R=0, B=0, G=0;
  
  for(int y=0; y<=gridResolutionY; ++y) {
    for(int x=0; x<=gridResolutionX; ++x) {
      float angle = (noiseXRange*noiseYRange/2)*TWO_PI*(x+y);
      pushMatrix();
      translate(tileSize*x, tileSize*y);
      
      //circle
      noFill();
      strokeWeight(1);
      stroke(R, B, G);
      rotate(angle);
      //circle(0,0,tileSize*0.75);
      quad(0,0, tileSize*0.45, tileSize*0.55, tileSize*1.22, tileSize*1.16, tileSize*0.80, tileSize*0.80);
      
      //hand
      pushMatrix();
      rotate(angle);
      shapeMode(CENTER);
      shape(hand, 0, 0, tileSize*0.50, tileSize*0.50);
      popMatrix();
      
      popMatrix();
      
      if(x % 2 == 0) {
        R += 5;
        B += 10;
        G += 15;
      }
      
      if(R >= 255) {
        R = 0;
      }
      if(B >= 255) {
        B = 0;
      }
      if(G >= 255) {
        G = 0;
      }
    }
  }
}

void keyReleased() {
  if (key == ' ') {
    saveFrame(timestamp()+"_####.png");
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
