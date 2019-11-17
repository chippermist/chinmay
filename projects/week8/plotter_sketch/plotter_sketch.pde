import processing.pdf.*;

size(792,612);

beginRecord(PDF, "plot.pdf");
noFill();

circle(width/2, height/2, 400);
for(int i=0; i<20; ++i) {
  pushMatrix();
  translate(width/2,height/2);
  // scaling instead of changing points since it's much easier 
  scale(1.9);
  rotate(i*radians(30));
  translate(0, -60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();
}

for(int i=0; i<5; ++i) {
circle(width/2, height/2, 100 + i);
}

endRecord();
