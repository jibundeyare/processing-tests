PVector myPMouse;
int threshold = 10;

void setup() {
  size(800, 600);
  myPMouse = new PVector(mouseX, mouseY);
}

void draw() {
}

void mouseMoved() {
  if (dist(mouseX, mouseY, myPMouse.x, myPMouse.y) >= threshold) {
    myMouseMoved();
    myPMouse.x = mouseX;
    myPMouse.y = mouseY;
  }
}

void myMouseMoved() {
  if (myPMouse.x != 0 && myPMouse.y != 0) {
    line(myPMouse.x, myPMouse.y, mouseX, mouseY);
  }
}

