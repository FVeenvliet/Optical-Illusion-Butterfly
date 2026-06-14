/*
Author: Femke Veenvliet, 1701452
Course: DBB100 Creative Programming
Date: 09/03/2026

The assignment was to create visual static art using Processing Java. In this document you will find the code and an explaination of it's function.
I decided to make a butterfly using interesting geometrical shapes known as "impossible shapes". I wanted to experiment with unusual shapes and shadow.
For some contrast I added a darker background and negative spaced flowers, so the design is still clear but detailed.

Special thanks to Daantje de Valk for helping me with the duplication of the wings.
Because part of this code is part of the Creative Programming assignment that I turned in in 2022 I credit myself for the structure and some of the shapes used in this code; all of the code, 
unless credited otherwise, is handwritten by me and belongs to me. I spend a lot of time and effort researching Processing methods and algorythms and will credit myself in this code where necessary. 

In this iteration, I redesigned the flower and refined the overall illustration for greater precision and quality. In the previous version, almost everything except the background was hard-coded. 
This time, I restructured the entire codebase, renamed most shapes for better readability, and replaced hard-coded values with for loops wherever possible, each implemented differently 
depending on the functionality required. I designed the code structure with a focus on reusability and enhancibility, especially the flowerField. This version gives more freedom to add more flowers,
and integrate new flower shapes. 

Enjoy!
*/

import processing.pdf.*;

boolean recording;

PShape body; // The butterfly is made out of two main parts, its body and its wings. Here I create the variables for these shapes.  
PShape wing;

void setup() { // Credits: Challenge1_butterfly by Femke Veenvliet, 2022
  size(1000, 1000, P2D);
  noLoop(); // The drawing is static, so no looping is needed.
  strokeWeight(2);
  stroke(255);
  body = createShape(GROUP); // The body consists out of four shapes, which I put in a group to be able to move the body around as a whole, rather than the four seperate parts.
  wing = createShape(GROUP); // One wing consists out of two custom shapes. I put the two together in a group so I can duplicate, rotate and translate the wing as a whole, rather than the two seperate parts.
  beginRaw(PDF, "Veenvliet_FP_challenge1");
}

// All tabs come together here to create the resulting image. Credits: Challenge1_butterfly, Femke Veenvliet 2022
void draw() {
  radialGradient(); // First the background is added to the illustration. Credits: Challenge1_butterfly by Femke Veenvliet, 2022
  flowerField(); // Then the two flowers, ready-made.

  // Placement of the butterfly's body.
  strokeWeight(2);
  translate(250, 250);
  pushMatrix();
  butterfly();
  shape(body);
  popMatrix();

  // Placement of the top right wing, the original wing.
  pushMatrix();
  translate(0, 50);
  shape(wing);
  popMatrix();

  // Placement of the top left wing.
  pushMatrix();
  scale(1, -1); // The original wing is mirrored over the Y-axis by scaling -1 in the Y-coordinate. Credits: https://discourse.processing.org/t/mirroring-pshape-objects-translation-rotation-issue/7099/5
  translate(500, -50);
  rotate(radians(180));
  shape(wing);
  popMatrix();

  // Placement of the bottom left wing.
  pushMatrix();
  translate(554.5, 451.5);
  scale(1.2, 1);
  rotate(radians(180));
  shape(wing);
  popMatrix();

  // Placement of the bottom right wing.
  pushMatrix();
  scale(1.2, -1); //Credits: https://discourse.processing.org/t/mirroring-pshape-objects-translation-rotation-issue/7099/5
  translate(-45, -450);
  shape(wing);
  popMatrix();
  
  endRaw();
}
