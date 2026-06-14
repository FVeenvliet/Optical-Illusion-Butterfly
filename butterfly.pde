/*
The void 'butterfly' contains the shapes that build first the wings, and then the body of the butterfly.  
WingA and WingB together form the top right wing, the base of all the other wings. All other wings consists of these two shapes, but are repeated, relocated and rotated in the 'void draw'.
Because of the complex nature of the "impossible" shape I was not able to create the wing in any other way than hard-coding it. 
Any suggestions on how to improve this part of the code are very welcome!

Credits: Challenge1_butterfly by Femke Veenvliet, 2022
*/

void butterfly() { 
  // WingA, the darkest shape within the wing.
  stroke(155, 97, 178);
  smooth();
  fill(155, 97, 178);
  PShape WingA = createShape(); // Credits: https://processing.org/reference/PShape.html
  WingA.beginShape();
  WingA.vertex(275, 200);
  WingA.vertex(275, 150);
  WingA.quadraticVertex(350, 40, 500, 25); // Credits: https://processing.org/reference/quadraticVertex_.html
  WingA.vertex(500, 25);
  WingA.quadraticVertex(435, 165, 315, 175);
  WingA.vertex(315, 175);
  WingA.vertex(325, 155);
  WingA.quadraticVertex(425, 130, 465, 50);
  WingA.vertex(465, 50);
  WingA.quadraticVertex(325, 75, 275, 200);
  WingA.endShape();

  // WingB, the lightest shape within the wing.
  stroke(218, 159, 242);
  smooth();
  fill(218, 159, 242);
  PShape WingB = createShape();
  WingB.beginShape();
  WingB.vertex(500, 75);
  WingB.vertex(500, 25);
  WingB.quadraticVertex(435, 165, 315, 175);
  WingB.vertex(315, 175);
  WingB.quadraticVertex(350, 100, 450, 70);
  WingB.vertex(457.5, 66);
  WingB.vertex(465, 50);
  WingB.quadraticVertex(325, 75, 275, 200);
  WingB.vertex(275, 200);
  WingB.quadraticVertex(425, 200, 500, 75);
  WingB.endShape();
  
  // Here both shaped WingA and WingB are added to the group 'wing', so the wing can be transformed as an object.
  wing.addChild(WingA); //credits: https://processing.org/reference/PShape_addChild_.html
  wing.addChild(WingB);

  // The following four shapes together form the butterfly's body.
  // The left side of the body:
  stroke(218, 159, 242);
  fill(218, 159, 242);
  PShape leftside_body = createShape();
  leftside_body.beginShape();
  leftside_body.vertex(225, 100);
  leftside_body.vertex(250, 125);
  leftside_body.vertex(250, 375);
  leftside_body.vertex(225, 400);
  leftside_body.endShape(CLOSE);
  
  // The right side of the body:
  stroke(182, 123, 206);
  fill(182, 123, 206);
  PShape rightside_body = createShape();
  rightside_body.beginShape();
  rightside_body.vertex(250, 125);
  rightside_body.vertex(275, 100);
  rightside_body.vertex(275, 400);
  rightside_body.vertex(250, 375);
  rightside_body.endShape(CLOSE);
  
  // The bottom square of the body:
  stroke(155, 97, 178);
  fill(155, 97, 178);
  PShape bottom_square = createShape(RECT, 0, 0, 35.355339, 35.355339); // To calculate the lengths of the side of these squares I used the Pythagoras Theorem, hence the strangely specific number.
  bottom_square.translate(442.5, 88.5);
  pushMatrix();
  bottom_square.rotate(radians(45));
  popMatrix();

  // The top square of the body: 
  stroke(155, 97, 178);
  fill(155, 97, 178);
  PShape top_square = createShape(RECT, 0, 0, 35.355339, 35.355339);
  top_square.translate(230, -123.5);
  pushMatrix();
  top_square.rotate(radians(45));
  popMatrix();

  // Here all the body shapes are added to the group 'body', so they can be transformed together as an object.
  body.addChild(leftside_body);
  body.addChild(rightside_body);
  body.addChild(top_square);
  body.addChild(bottom_square);
}
