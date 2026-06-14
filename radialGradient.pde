/* 
The void 'radialGradient' draws a series of concentric circles to create a radial gradient background.

Credits: 
- https://forum.processing.org/one/topic/circle-gradient.html
- https://processing.org/examples/radialgradient.html
- Challenge1_butterfly by Femke Veenvliet, 2022
*/ 
void radialGradient() {
  background(255);
  smooth();
  noStroke();
  ellipseMode(CENTER); // Credit: https://processing.org/reference/ellipseMode_.html

  final int w = width, h = height;
  final int cx = w / 2, cy = h / 2; // The cx and cy coordinates are equal to the width and heigth of the screen divided by two, so together they form the coordinates of the center point of the circle, in the middle of the screen.
  final int step = 20; // The width of every layer of circles is defined here by a 'step', which equals 20 pixels in this case.

  for (int i = 0; i <= w; i += step) { // 'i' is the step by which the width and heigth decrease with every circle drawn. Everytime one step is taken, a new circle gets drawn.
    fill((int) map(i, 0, w, 0, 255)); // The term 'map' is used here to let the for loop calculate which colour every circle should be. With every step taken the colour gets a little bit lighter. 
    ellipse(cx, cy, w - i, h - i); // With every circle that is drawn the width and heigth of the cirlce decrease by one step, which creates the layered background.
    }
}
