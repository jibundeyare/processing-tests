/**
 * requirement :
 * - processing 2.2.1
 */

int points;
int r;
int donutWidth;

float theta;
float x;
float y;

void setup() {
	size(800, 600, P3D);

  points = 40;
  r = 100;
  donutWidth = 50;
}

void draw() {
	background(200);

  translate(width / 2, height / 2);

  fill(255);
  stroke(0);

  beginShape();

  for (int i = 0; i < points; i++){
        theta = (TWO_PI / points) * i;
        x = r * cos(theta);
        y = r * sin(theta);
        vertex(x, y);
  }

  beginContour();

  for (int i = points - 1; i >= 0; i--){
        theta = (TWO_PI / points) * i;
        x = (r - donutWidth) * cos(theta);
        y = (r - donutWidth) * sin(theta);
        vertex(x, y);
  }

  endContour();

  endShape(CLOSE);
}

