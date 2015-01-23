/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;
PVector oPreviousMousePosition = new PVector();
int iHalfWidth = 5;
int ppmouseX = 0;
int ppmouseY = 0;

void setup() {
	size(800, 600, P3D);
	oCanvas = createGraphics(width, height);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
	image(oCanvas, 0, 0);
}

void mouseDragged() {
	/* drawMouseVector(); */

	if (ppmouseX == 0 && ppmouseY == 0) {
		ppmouseX = pmouseX;
		ppmouseY = pmouseY;
	} else {
		ppmouseX = pmouseX;
		ppmouseY = pmouseY;
		drawStrip();
	}
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

void drawStrip() {
	PVector oMouseVector = getMouseVector();
	PVector oPMouseVector = getPMouseVector();

	oCanvas.beginDraw();
	oCanvas.pushMatrix();

	oCanvas.translate(pmouseX, pmouseY);
	oCanvas.rotate(oMouseVector.heading());

	/* oCanvas.stroke(0); */
	oCanvas.noStroke();
	oCanvas.fill(255);

	oCanvas.beginShape();
	// bottom left
	oCanvas.vertex(0, -iHalfWidth);
	// top left
	oCanvas.vertex(oPMouseVector.mag(), -iHalfWidth);
	// top right
	oCanvas.vertex(oPMouseVector.mag(), iHalfWidth);
	// bottom right
	oCanvas.vertex(0, iHalfWidth);
	oCanvas.endShape(CLOSE);

	oCanvas.popMatrix();
	oCanvas.endDraw();

	/* bottom left */
	/* pushMatrix(); */
	/* translate(pmouseX, pmouseY); */
	/* rotate(oMouseVector.heading() + HALF_PI); */
	/* stroke(0); */
	/* noFill(); */
	/* line(0, 0, 50, 0); */
	/* popMatrix(); */

	/* bottom right */
	/* pushMatrix(); */
	/* translate(pmouseX, pmouseY); */
	/* rotate(oMouseVector.heading() - HALF_PI); */
	/* stroke(0); */
	/* noFill(); */
	/* line(0, 0, 50, 0); */
	/* popMatrix(); */
}

PVector getPMouseVector() {
	return new PVector(pmouseX - ppmouseX, pmouseY - ppmouseY);
}

PVector getMouseVector() {
	return new PVector(mouseX - pmouseX, mouseY - pmouseY);
}

