/*
The void 'flowerField' assembles the background flowers into complete plants by the shapes in 'flowerHeads' and 'leaves' with stems, so the flowerField can be placed into scene as a whole.
This structure keeps the code flexible. New arrangements can be composed here from existing shapes, keeping this void the single place responsible for layout and placement.
*/ 

void flowerField() { // Here all the shapes are combined to create the complete flowers with stems and leaves.

  // Building the complete plant on the left:
  // Left plant flowers:
  flowerA(); // Middle flower of the left plant, the original flower.

  // Bottom flower of the left plant.
  pushMatrix();
  translate(-125, 75);
  flowerA(); 
  popMatrix();

  // Top flower of the left plant.
  pushMatrix();
  translate(-75, -100);
  flowerA(); 
  popMatrix();

  // The following curves are the stems of the left flower.
  pushStyle(); 
  noFill();
  stroke(255);
  strokeWeight(5);
  curve(50, 225, 200, 1000, 150, 375, 200, 1750);// Main stem. Credit: https://processing.org/reference/curve_.html
  curve(300, 500, 180, 700, 100, 550, 300, 300);// Little left stem.
  curve(300, 500, 178, 600, 225, 475, 0, 0);// Little right stem.
  popStyle();
 
  // Leaves attached to the left flower.
  leafATransform[] leavesA = {
    new leafATransform(45, 170, 0.8, 0.8),
    new leafATransform(60, 350, 0.8, 0.8),
    new leafATransform(-390, 230, -1, 0.8),
    new leafATransform(-30, 225, 1, 1),
    new leafATransform(-355, 300, -1, 1)
  };

  for (leafATransform lf : leavesA) { // For every new leaf that is created in the list leavesA:...
    pushMatrix();
    scale(lf.sx, lf.sy);       // Scale first.
    translate(lf.tx, lf.ty);   // Then translate.
    leafA(); // Place a leaf in this location.
    popMatrix();
  }
  
  // Building the complete flower on the right:
  flowerB();  // Flower of the right plant.
  insideFlowerB(); // The inside of the flower on the right.
  leavesB(); // The little leaves below the flower on the right.
  
  // Stem of the plant on the right.
  pushStyle();
  noFill();
  stroke(255);
  strokeWeight(5);
  curve(700, 700, 900, 1000, 900, 500, 700, 700); 
  popStyle();
}
