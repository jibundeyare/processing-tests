/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;

PVector myMouse;
PVector myPMouse;
PVector myPPMouse;
boolean isPPMouseRecorded = false;

PVector currentVector;
PVector previousVector;

// @warning when iHalfWidth is set to an even value (like 20), grey lines appear in the strip
int iHalfWidth = 19;
int threshold = 10;

// @info when isDebugMode is set to true, only vectors that compose the strip are displayed
boolean isDebugMode = false;

void setup() {
  size(800, 600, P3D);
  oCanvas = createGraphics(width, height);
  myMouse = new PVector();
  myPMouse = new PVector();
  myPPMouse = new PVector();
  currentVector = new PVector();
  previousVector = new PVector();
}

void draw() {
  frame.setTitle(int(frameRate) + " fps");
  background(200);
  image(oCanvas, 0, 0);
}

void debug() {
  println("isPPMouseRecorded: " + isPPMouseRecorded);
  println("myPPMouse: " + myPPMouse);
  println("myPMouse: " + myPMouse);
  println("myMouse: " + myMouse);
  println("currentVector: " + currentVector);
  println("currentVector.mag(): " + currentVector.mag());
  println("previousVector: " + previousVector);
}

void mouseDragged() {
  if (dist(mouseX, mouseY, myPMouse.x, myPMouse.y) >= threshold) {
    if (!isPPMouseRecorded) {
      isPPMouseRecorded = true;

      // update mouse position
      myMouse.set(mouseX, mouseY);

      // update vectors
      currentVector = getCurrentVector();
      previousVector = getPreviousVector();

      if (isDebugMode) {
        debug();
      }

      if (!isDebugMode) {
        drawStrip();
      }

      if (isDebugMode) {
        drawCurrentVector();
        drawPreviousVector();
        drawPerpendiculars();
      }

      // update previous mouse position
      myPMouse.set(mouseX, mouseY);
    } else {
      // update mouse position
      myMouse.set(mouseX, mouseY);

      // update vectors
      currentVector = getCurrentVector();
      previousVector = getPreviousVector();

      if (isDebugMode) {
        debug();
      }

      if (!isDebugMode) {
        drawStrip();
      }

      if (isDebugMode) {
        drawCurrentVector();
        drawPreviousVector();
        drawPerpendiculars();
      }

      // update previous mouse positions
      myPPMouse.set(myPMouse.x, myPMouse.y);
      myPMouse.set(myMouse.x, myMouse.y);
    }
  }
}

void mousePressed() {
  isPPMouseRecorded = false;
  myMouse.set(mouseX, mouseY);
  myPMouse.set(mouseX, mouseY);
  myPPMouse.set(mouseX, mouseY);
  currentVector.set(0, 0);
  previousVector.set(0, 0);

  if (isDebugMode) {
    debug();
  }
}

void keyPressed() {
  if (key == ' ') {
    clearCanvas();
  }
}

PVector getCurrentVector() {
  return PVector.sub(myMouse, myPMouse);
}

PVector getPreviousVector() {
  return PVector.sub(myPMouse, myPPMouse);
}

void clearCanvas() {
  oCanvas.clear();
  oCanvas.beginDraw();
  oCanvas.endDraw();
}

void drawCurrentVector() {
  oCanvas.beginDraw();
  oCanvas.fill(255);
  oCanvas.stroke(255);

  oCanvas.line(myPMouse.x, myPMouse.y, myPMouse.x + currentVector.x, myPMouse.y + currentVector.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myPMouse.x, myPMouse.y);
    oCanvas.rotate(currentVector.heading());
    oCanvas.translate(currentVector.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 5, -5, -5, -5);
  oCanvas.popMatrix();

  oCanvas.endDraw();
}

void drawPreviousVector() {
  oCanvas.beginDraw();
  oCanvas.fill(0);
  oCanvas.stroke(0);

  oCanvas.line(myPPMouse.x, myPPMouse.y, myPPMouse.x + previousVector.x, myPPMouse.y + previousVector.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myPPMouse.x, myPPMouse.y);
    oCanvas.rotate(previousVector.heading());
    oCanvas.translate(previousVector.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 5, -5, -5, -5);
  oCanvas.popMatrix();

  oCanvas.endDraw();
}

void drawPerpendiculars() {
  PVector headRight = new PVector(-currentVector.y, currentVector.x);
  headRight.normalize();
  headRight.mult(iHalfWidth);

  PVector headLeft = new PVector(currentVector.y, -currentVector.x);
  headLeft.normalize();
  headLeft.mult(iHalfWidth);

  PVector tailRight;

  if (previousVector.x == 0 && previousVector.y == 0) {
    tailRight = new PVector(-currentVector.y, currentVector.x);
  } else {
    tailRight = new PVector(-previousVector.y, previousVector.x);
  }

  tailRight.normalize();
  tailRight.mult(iHalfWidth);

  PVector tailLeft;

  if (previousVector.x == 0 && previousVector.y == 0) {
    tailLeft = new PVector(currentVector.y, -currentVector.x);
  } else {
    tailLeft = new PVector(previousVector.y, -previousVector.x);
  }

  tailLeft.normalize();
  tailLeft.mult(iHalfWidth);

  oCanvas.beginDraw();

  oCanvas.fill(0, 255, 0);
  oCanvas.stroke(0, 255, 0);
  oCanvas.line(myMouse.x, myMouse.y, myMouse.x + headRight.x, myMouse.y + headRight.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myMouse.x, myMouse.y);
    oCanvas.rotate(headRight.heading());
    oCanvas.translate(headRight.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 3, -3, -3, -3);
  oCanvas.popMatrix();

  oCanvas.fill(255, 0, 0);
  oCanvas.stroke(255, 0, 0);
  oCanvas.line(myMouse.x, myMouse.y, myMouse.x + headLeft.x, myMouse.y + headLeft.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myMouse.x, myMouse.y);
    oCanvas.rotate(headLeft.heading());
    oCanvas.translate(headLeft.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 3, -3, -3, -3);
  oCanvas.popMatrix();

  oCanvas.fill(0, 0, 255);
  oCanvas.stroke(0, 0, 255);
  oCanvas.line(myPMouse.x, myPMouse.y, myPMouse.x + tailRight.x, myPMouse.y + tailRight.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myPMouse.x, myPMouse.y);
    oCanvas.rotate(tailRight.heading());
    oCanvas.translate(tailRight.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 3, -3, -3, -3);
  oCanvas.popMatrix();

  oCanvas.fill(255, 0, 255);
  oCanvas.stroke(255, 0, 255);
  oCanvas.line(myPMouse.x, myPMouse.y, myPMouse.x + tailLeft.x, myPMouse.y + tailLeft.y);

  oCanvas.pushMatrix();
    oCanvas.translate(myPMouse.x, myPMouse.y);
    oCanvas.rotate(tailLeft.heading());
    oCanvas.translate(tailLeft.mag(), 0);
    oCanvas.rotate(-HALF_PI);
    oCanvas.triangle(0, 0, 3, -3, -3, -3);
  oCanvas.popMatrix();

  oCanvas.endDraw();
}

void drawStrip() {
  PVector headRight = new PVector(-currentVector.y, currentVector.x);
  headRight.normalize();
  headRight.mult(iHalfWidth);

  PVector headLeft = new PVector(currentVector.y, -currentVector.x);
  headLeft.normalize();
  headLeft.mult(iHalfWidth);

  PVector tailRight;

  if (previousVector.x == 0 && previousVector.y == 0) {
    tailRight = new PVector(-currentVector.y, currentVector.x);
  } else {
    tailRight = new PVector(-previousVector.y, previousVector.x);
  }

  tailRight.normalize();
  tailRight.mult(iHalfWidth);

  PVector tailLeft;

  if (previousVector.x == 0 && previousVector.y == 0) {
    tailLeft = new PVector(currentVector.y, -currentVector.x);
  } else {
    tailLeft = new PVector(previousVector.y, -previousVector.x);
  }

  tailLeft.normalize();
  tailLeft.mult(iHalfWidth);

  oCanvas.beginDraw();
  oCanvas.fill(255);
  oCanvas.stroke(255);

  oCanvas.beginShape();
  oCanvas.vertex(myMouse.x + headRight.x, myMouse.y + headRight.y);
  oCanvas.vertex(myMouse.x + headLeft.x, myMouse.y + headLeft.y);
  oCanvas.vertex(myPMouse.x + tailLeft.x, myPMouse.y + tailLeft.y);
  oCanvas.vertex(myPMouse.x + tailRight.x, myPMouse.y + tailRight.y);
  oCanvas.endShape();

  oCanvas.endDraw();
}

