class Swatch{
 float rad;
 PVector position;
 int red;
 int green;
 int blue;
 int order;
 boolean selected;
 boolean locked = false;
 
 Swatch(int x,int y, float radius, int r, int g, int b){
  position = new PVector(x,y);
   rad = radius;
   red = r;
   green = g;
   blue = b;
   selected = false;
 }
 
  boolean hitTest(int x,int y){
    if(pow(x - position.x,2) + pow(y - position.y,2) < pow(rad,2)){
      return true;
      
     }
    
    return false; 
  }
 
 void moveBy(PVector delta){
    position.add(delta); 
 }
 
 void updateColor(PVector delta, int mouseWheel){
   red += delta.y;
   green += delta.x;
   blue += mouseWheel;

 }
 void draw(){
   colorMode(RGB,255);
   if(selected){
     strokeWeight(2);
     stroke(255);
   }
   else{
     noStroke();
   }
   
   colorMode(RGB, 100);
   fill(red,green,blue);
   ellipseMode(CENTER);
   ellipse(position.x,position.y,rad,rad);
   if(locked == false){
     rad -=0.015;
   }
 }
 
}
