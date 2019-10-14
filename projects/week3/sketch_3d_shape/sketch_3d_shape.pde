import controlP5.*;
ControlP5 cp5;

int resolution = 25;

float frequency = 0.1;
float amplitude = 1.0;
float objectHeight = 500;
int shapeTypes = 1;

Controller ringResSlider;
Controller freqSlider;
Controller amplitudeSlider;
Controller heightSlider;
Controller shapeType;


void setup() {
  size(1024, 768, P3D);
  cp5 = new ControlP5(this);

  ringResSlider =  cp5.addSlider("resolution")
    .setPosition(25, 25)
    .setRange(3, 50)
    ;

  freqSlider = cp5.addSlider("frequency")
    .setPosition(25, 50)
    .setRange(0.1, 1)
    ;

  amplitudeSlider =  cp5.addSlider("amplitude")
    .setPosition(25, 75)
    .setRange(1.0, 6);
    ;

  shapeType = cp5.addDropdownList("shapeTypes")
    .setPosition(25, 125)
    .addItem("QUADS", 1)
    .addItem("QUAD_STRIP", 2)
    .addItem("TRIANGLES_FAN", 3);
 
}


void draw() {
int rowNum = 50;
float quadHeight = objectHeight/rowNum;

  background(0);
  lights();
  pushMatrix();
  translate(width / 2, height / 2 - rowNum*quadHeight / 2 , -100);
  fill(255,0,0);
  stroke(0,255,255);
  strokeWeight(1);
  rotateY((float)(frameCount * Math.PI/2 / 400));

  Point3D[][] verticies = calculateVerticies(rowNum, quadHeight);
  
  switch((int)shapeType.getValue()) {
    case 1:
      beginShape(QUADS);
      break;
    case 2:
      beginShape(QUAD_STRIP);
      break;
    case 3:
      beginShape(TRIANGLE_FAN);
      break;
  }
  
  for (int i=1; i<verticies.length; i++) {
    Point3D[] pointListTop = verticies[i-1];
    Point3D[] pointListBottom = verticies[i];


    for (int j=0; j<=pointListTop.length; j++) {
      int t;
      if (j<pointListTop.length) {
        t = j;
      } else {
        t = 0;
      }
      Point3D bottom = pointListBottom[t];
      Point3D top = pointListTop[t];
      vertex(top.x, top.y, top.z);
      vertex(bottom.x, bottom.y, bottom.z);
    }
  }

  endShape(CLOSE);

  popMatrix();
}



Point3D[][] calculateVerticies(int rowNum, float quadHeight) {
  Point3D[][] verticies = new Point3D[rowNum][resolution];
  
  for (int i=0; i<rowNum; i++) {
    float y = quadHeight*i;
    float theta = map(i,0,rowNum,0,8*PI);
    float r = (1+sin(theta*frequency))*amplitude/2;
    println(r);
    Point3D[] pointList = calculatePoints(r*100, y, resolution);
    verticies[i] = pointList;
  }
  return verticies;
}


Point3D[] calculatePoints(float r, float y, int res) {
  Point3D [] pointList = new Point3D[res];
  for (int i =0; i<res; i++) {
    float theta = 2*PI/res*i*PI;
    float x = cos(theta)*r*PI/2;
    float z = sin(theta)*r*PI/2;
    Point3D p = new Point3D(x, y, z);
    pointList[i] = p;
  }

  return pointList;
}
