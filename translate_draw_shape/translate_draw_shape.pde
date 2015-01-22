/**
 * requirement :
 * - processing 2.2.1
 */

PVector oPosition;

void setup() {
	size(800, 600, P3D);
	oPosition = new PVector(width / 2, height / 2);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);

	/* use `PVector.mag()` to get the length of the vector */
	/* now it's possible to get a shape with one `translate()` */

	pushMatrix();

	translate(oPosition.x, oPosition.y);

	stroke(0);
	fill(255);

	beginShape();
	vertex(20, 0);
	vertex(10, 10);
	vertex(-10, 10);
	vertex(-20, 0);
	endShape(CLOSE);

	stroke(0);
	fill(255, 0, 0);

	ellipse(0, 0, 10, 10);

	popMatrix();
}

