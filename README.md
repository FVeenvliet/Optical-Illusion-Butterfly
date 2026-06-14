# Veenvliet FP Challenge 1 — Creative Programming Assignment

**Author:** Femke Veenvliet (student ID: 1701452)  
**Course:** DBB100 Creative Programming  
**Date:** 09/03/2026  
**Output format:** PDF (`Veenvliet_FP_challenge1`)

---

## About

This project is a piece of static digital art created in Processing 4.5.2 (Java mode). It depicts a **butterfly** constructed from geometrically complex "impossible shapes," set against a radial gradient background with negative-space flowers.

The work explores:
- Unusual geometrical forms and optical illusion ("impossible shapes")
- Depth and contrast using colour gradients within shapes
- Reusability and structure in creative code, replacing hard-coded values with for loops wherever possible

This is an updated version of a piece originally submitted in 2022. In this iteration, the flower design was fully redesigned, the codebase was restructured for readability and extensibility, and most hard-coded values were replaced with loops and reusable components.

---

## Sketch Overview

The sketch runs at **1000 × 1000 pixels** in P2D mode and exports directly to PDF on launch. It does not loop, the drawing is fully static.

The image is composed of three main elements drawn in this order:

1. **Radial gradient background** — a series of concentric circles fading from dark to light
2. **Flower field** — two background plants (left and right) with stems, leaves, and flower heads
3. **Butterfly** — a central butterfly made of four wings and a body, all derived from a single base wing shape

---

## Code Structure

The sketch is split across five tabs:

### `VeenvlietFPchallenge1` (Main tab)
Sets up the canvas, initialises the `body` and `wing` PShape groups, and sequences all drawing calls in `draw()`. The four wings are produced by transforming (translating, rotating, scaling/mirroring) a single base wing.

### `butterfly`
Defines the `butterfly()` function, which builds:
- **WingA** and **WingB** — two interlocking quadratic Bézier shapes that together form one "impossible" wing, added to the `wing` group
- **leftside_body**, **rightside_body**, **top_square**, **bottom_square** — four shapes forming the body, added to the `body` group

The wing is hard-coded due to the complexity of the impossible shape geometry.

### `flowerField`
Assembles the two complete plants from their component shapes, stems, and leaves. This is the single place responsible for layout and placement, keeping the code flexible and easy to extend with new flower arrangements.

### `flowerHeads`
Defines the flower head shapes:
- **`flowerA()`** — four ellipses rotated in a for loop to form a simple negative-space flower (used three times on the left plant)
- **`flowerB()`** — a custom petal shape repeated and transformed via arrays to form the right flower
- **`insideFlowerB()`** — lines and small ellipses forming the stamen of the right flower

### `leaves`
Defines all leaf shapes:
- **`leafATransform`** (class) — a data class storing translation (tx, ty) and scale (sx, sy) values, used to drive a for loop that places and transforms multiple `leafA` instances
- **`leafA()`** — the base leaf shape for the left plant
- **`leavesB()`** — two small leaf shapes below the right flower

### `radialGradient`
Draws the background using a for loop over concentric ellipses, mapping loop index to fill colour using Processing's `map()` function.

---

## Dependencies

- [Processing 4.5.2](https://processing.org/) with the **PDF** library (included with Processing)

No external libraries are required.

---

## Running the Sketch

1. Open Processing 4.5.2.
2. Open `VeenvlietFPchallenge1.pde` (all tabs will load automatically).
3. Press **Run**.
4. The sketch window will open and the image will be drawn once.
5. A PDF named `Veenvliet_FP_challenge1` will be saved to the sketch folder.

---

## Credits

| Contribution | Source |
|---|---|
| Making this README file | [Make A Read Me](https://www.makeareadme.com/) |
| Overall structure and base shapes | Femke Veenvliet — *Challenge1_butterfly* (2022) |
| Wing duplication approach | Daantje de Valk |
| PShape mirroring technique | [Processing Discourse](https://discourse.processing.org/t/mirroring-pshape-objects-translation-rotation-issue/7099/5) |
| PShape reference | [processing.org/reference/PShape.html](https://processing.org/reference/PShape.html) |
| `addChild()` reference | [processing.org/reference/PShape_addChild_.html](https://processing.org/reference/PShape_addChild_.html) |
| Radial gradient technique | [Processing Forum](https://forum.processing.org/one/topic/circle-gradient.html) · [Processing Examples](https://processing.org/examples/radialgradient.html) |
| `quadraticVertex()` | [processing.org/reference/quadraticVertex_.html](https://processing.org/reference/quadraticVertex_.html) |
| `curve()` | [processing.org/reference/curve_.html](https://processing.org/reference/curve_.html) |
| `for` loop | [processing.org/reference/for.html](https://processing.org/reference/for.html) |
| `class` | [processing.org/reference/class.html](https://processing.org/reference/class.html) |
| `this` keyword | [processing.org/reference/this.html](https://processing.org/reference/this.html) |

All code not credited above is original work by Femke Veenvliet.
