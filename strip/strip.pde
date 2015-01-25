/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;
PVector oPreviousMousePosition = new PVector();
int iHalfWidth = 5;

void setup() {
	size(800, 600, P3D);
	oCanvas = createGraphics(width, height);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
	image(oCanvas, 0, 0);
}

void mousePressed() {
	setPreviousMousePosition();
}

void mouseDragged() {
	drawStrip();
	setPreviousMousePosition();
	/* drawMouseVector(); */
}

PVector getMouseVector() {
	return new PVector(mouseX - oPreviousMousePosition.x, mouseY - oPreviousMousePosition.y);
}

void setPreviousMousePosition() {
	oPreviousMousePosition.x = mouseX;
	oPreviousMousePosition.y = mouseY;
}

void drawMouseVector() {
	oCanvas.beginDraw();
	oCanvas.stroke(0);
	oCanvas.noFill();
	oCanvas.line(oPreviousMousePosition.x, oPreviousMousePosition.y, mouseX, mouseY);
	oCanvas.noStroke();
	oCanvas.fill(0);
	oCanvas.ellipse(mouseX, mouseY, 5, 5);
	oCanvas.endDraw();
}

void drawStrip() {
	PVector oMouseVector = getMouseVector();

	oCanvas.beginDraw();
	oCanvas.pushMatrix();
	oCanvas.translate(oPreviousMousePosition.x, oPreviousMousePosition.y);
	oCanvas.rotate(oMouseVector.heading());
	oCanvas.noStroke();
	oCanvas.fill(255);

	oCanvas.beginShape();
	// bottom left
	oCanvas.vertex(0, -iHalfWidth);
	// top left
	oCanvas.vertex(oMouseVector.mag(), -iHalfWidth);
	// top right
	oCanvas.vertex(oMouseVector.mag(), iHalfWidth);
	// bottom right
	oCanvas.vertex(0, iHalfWidth);
	oCanvas.endShape(CLOSE);

	oCanvas.popMatrix();
	oCanvas.endDraw();
}

