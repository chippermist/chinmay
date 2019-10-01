// new face 
// Chinmay Garg

size(600,600);

//set the background color to white
background(255,255,255);

rectMode(CENTER);

// set color to be the face
fill(231,173,40);

// draw the face circle
circle(width/2, height/2, 400);

// set it to white 
fill(255,255,255);

// set color to black
fill(0,0,0);

// draw the eyes
circle(width/2-80, height/2-80, 20);
circle(width/2+80, height/2-80, 20);

// set it to white 
fill(255,255,255);

//set ellipse mode to center
ellipseMode(CENTER);

// set mouth color
fill(231,76,60);

//draw an ellipse in the center of the canvas (the mouth)
ellipse(width/2,height/2+50,200,40);
