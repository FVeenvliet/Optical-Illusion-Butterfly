/* 
This tab defines the shapes that make up the flower heads.
Currently contains flowerA (left) and flowerB (right), named by type rather than position so they remain reusable if moved or duplicated.
*/ 

// Building the flowerhead on the left, built out of four ellipses: 
void flowerA() { // This "for loop" creates the flowers seen on the left of the butterfly.
  pushMatrix();
  fill(255);
  translate(225, 475);
  for (int i = 0; i < 4; i++) { // Four ellipses are drawn, and every next ellipse gets rotated by 1/4 pi, creating a flower-like shape. //Credit: https://processing.org/reference/for.html
    rotate(TWO_PI/8.0); // Credit: https://processing.org/reference/cos_.html
    ellipseMode(CENTER);
    ellipse(0, 0, 80, 30);
  }
  popMatrix();
}

// Building the flower on the right:
void flowerB() { 
  
  // This petal is the base for the flower on the right. 
  // Credits: Challenge1_butterfly by Femke Veenvliet, 2022
  PShape petalB = createShape();
  petalB.beginShape();
  petalB.vertex(900, 500);
  petalB.quadraticVertex(935, 450, 900, 400);
  petalB.vertex(900, 400);
  petalB.quadraticVertex(865, 450, 900, 500);
  petalB.endShape();
  
  shape(petalB);
  
  // Stores transformations needed to create more petals to form a flower. Doing this allows for repetition of a shape in an uneven pattern, if desired.
  float[] tx = {295, -125, -62.5, 180};  // Each step is one transformation on the X-axis, so one petal.
  float[] ty = {-335, 425, 867.5, 1240}; // Transformations on the Y-axis for each petal.
  float[] angles = {25, -25, -50, -75};    // Rotations of each petal.
  
  // The first petal is repeated and transformed so the five petals together form the flower on the right.
  for (int i = 0; i < angles.length; i++) { // For each step and for as many as the amount of values stored in the list 'angles'...
    pushMatrix();
    translate(tx[i], ty[i]); // Make the translation corresponding with the values in the lists 'tx' and 'ty'.
    rotate(radians(angles[i])); // Make the rotation corresponding with the value in list 'angles'.
    shape(petalB); // Place a new petal in that place.
    popMatrix();
  }
}

// The following lines and circles are the inside of the flower on the right.
void insideFlowerB() {
  pushStyle();
  fill(255);
  stroke(255);
  strokeWeight(1);
  line(900, 500, 880, 400);
  line(900, 500, 840, 420);
  line(900, 500, 810, 455);
  line(900, 500, 920, 400);
  ellipse(880, 400, 5, 5);
  ellipse(840, 420, 5, 5);
  ellipse(810, 455, 5, 5);
  ellipse(920, 400, 5, 5);
  popStyle();
}
