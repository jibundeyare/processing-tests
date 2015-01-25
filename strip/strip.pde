/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;
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

void mouseDragged() {
	drawStrip();
}

PVector getMouseVector() {
	return new PVector(mouseX - pmouseX, mouseY - pmouseY);
}

void drawStrip() {
	PVector oMouseVector = getMouseVector();

	oCanvas.beginDraw();
	oCanvas.pushMatrix();
	oCanvas.translate(pmouseX, pmouseY);
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

