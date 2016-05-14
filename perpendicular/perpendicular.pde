/**
 * draw a vector perpendicular to another vector
 * the black vector is the original one
 * the green vector is right handed and starts from the tail of the original vector
 * the red vector is left handed and starts from the tail of the original vector
 * the blue vector is right handed and starts from the middle of the original vector
 * the pink vector is right handed and starts from the head of the original vector
 */

int x, y;

void setup() {
  size(800, 600);
  randomVector();
}

void draw() {
  background(255);

  stroke(200);
  line(0, height / 2, width, height / 2);
  line(width / 2, 0, width / 2, height);
  translate(width / 2, height / 2);

  // original vector
  PVector a = new PVector(x, y);
  stroke(0);
  line(0, 0, a.x, a.y);

  // right hand perpendicular vector
  PVector a2 = new PVector(-a.y, a.x);
  stroke(0, 255, 0);
  line(0, 0, a2.x, a2.y);

  // left hand perpendicular vector
  PVector a3 = new PVector(a.y, -a.x);
  stroke(255, 0, 0);
  line(0, 0, a3.x, a3.y);

  // right hand perpendicular vector at given location
  PVector position = a.get();
  position.mult(0.5);
  PVector a4 = new PVector(-a.y, a.x);
  a4.add(position);
  stroke(0, 0, 255);
  line(position.x, position.y, a4.x, a4.y);

  // right hand perpendicular vector at vector end
  PVector a5 = new PVector(-a.y, a.x);
  a5.add(a);
  stroke(255, 0, 255);
  line(a.x, a.y, a5.x, a5.y);
}

void mouseClicked() {
  randomVector();
}

void randomVector() {
  x = round(random(-100, 100));
  y = round(random(-100, 100));
}

