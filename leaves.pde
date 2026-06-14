/*
This tab defines all leaf shapes used by the background flowers.
leafA belongs to flowerA. leafB1 (left) and leafB2 (right) belong to flowerB.
Leaves are named by association rather than position for the same reason as the flowers, to keep them reusable and placement-independent.
*/

// Creates a class describing how I want leafA to be able to transform:
class leafATransform { // Credit: https://processing.org/reference/class.html
  float tx, ty; // The transformation over the X- and Y- axis are of value type float.
  float sx, sy; // The scaling over the X- and Y- axis are of value type float. Scaling the leaves enables both size variation and mirroring.
  
  leafATransform(float tx, float ty, float sx, float sy) { // Defines an array shape that can be reused throughout the code. Each time a new leafATransform is created, the code knows how to interpret the numerical inputs that describe the desired leaf transformation. 
    // Connecting the values in the array to the floats that were defined earlier:
    this.tx = tx; // Credit: https://processing.org/reference/this.html
    this.ty = ty;
    this.sx = sx;
    this.sy = sy;
  }
}

// The shape of the base leave for the flower on the left.
void leafA() {
  PShape leafA = createShape();
  leafA.beginShape();
  leafA.vertex(105, 425);
  leafA.quadraticVertex(135, 465, 165, 450);
  leafA.vertex(165, 450);
  leafA.quadraticVertex(125, 410, 105, 425);
  leafA.endShape();
  shape(leafA);
}

// The following two shapes are the little leaves below the petals of the right flower.
void leavesB() {
  PShape leafB1 = createShape();
  leafB1.beginShape();
  leafB1.vertex(900, 500);
  leafB1.quadraticVertex(875, 485, 860, 525);
  leafB1.vertex(860, 525);
  leafB1.quadraticVertex(875, 500, 900, 500);
  leafB1.endShape();
  shape(leafB1);
  
  PShape leafB2 = createShape(); 
  leafB2.beginShape();
  leafB2.vertex(900, 500);
  leafB2.quadraticVertex(925, 475, 950, 500);
  leafB2.vertex(950, 500);
  leafB2.quadraticVertex(925, 485, 900, 500);
  leafB2.endShape();
  shape(leafB2);
}
