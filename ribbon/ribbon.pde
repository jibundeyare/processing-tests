/**
 * requirement :
 * - processing 2.2.1
 */

PVector oPreviousMousePosition = new PVector();

void setup() {
	size(800, 600, P3D);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
}

void mouseDragged() {
	drawMouseVector();
	drawRibbon();
}

void setPreviousMousePosition() {
	if (pmouseX != mouseX || pmouseY != mouseY) {
		oPreviousMousePosition.x = pmouseX;
		oPreviousMousePosition.y = pmouseY;
	}
}

void drawMouseVector() {
	stroke(0);
	noFill();
	line(pmouseX, pmouseY, mouseX, mouseY);
	noStroke();
	fill(0);
	ellipse(mouseX, mouseY, 5, 5);
}

void drawRibbon() {
	PVector oMouseVector = getMouseVector();

	/* bottom left */
	pushMatrix();
	translate(pmouseX, pmouseY);
	rotate(oMouseVector.heading() + HALF_PI);
	stroke(0);
	noFill();
	line(0, 0, 50, 0);
	popMatrix();

	/* bottom right */
	pushMatrix();
	translate(pmouseX, pmouseY);
	rotate(oMouseVector.heading() - HALF_PI);
	stroke(0);
	noFill();
	line(0, 0, 50, 0);
	popMatrix();
}

PVector getMouseVector() {
	return new PVector(mouseX - pmouseX, mouseY - pmouseY);
}

