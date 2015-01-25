/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;
PVector oPMousePosition = new PVector();
int iHalfWidth = 5;

void setup() {
	size(800, 600, P3D);
	oCanvas = createGraphics(width, height);
	resetPMousePosition();
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
	image(oCanvas, 0, 0);
}

void mousePressed() {
	setPMousePosition();
}

void mouseReleased() {
	resetPMousePosition();
}

void mouseDragged() {
	drawStrip();
	/* drawMouseVector(); */
	setPMousePosition();
}

void setPMousePosition() {
	oPMousePosition.x = mouseX;
	oPMousePosition.y = mouseY;
}

void resetPMousePosition() {
	oPMousePosition.x = -1;
	oPMousePosition.y = -1;
}

PVector getMouseVector() {
	return new PVector(mouseX - oPMousePosition.x, mouseY - oPMousePosition.y);
}

void drawStrip() {
	PVector oMouseVector = getMouseVector();

	oCanvas.beginDraw();
	oCanvas.pushMatrix();
	oCanvas.translate(oPMousePosition.x, oPMousePosition.y);
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

void drawMouseVector() {
	oCanvas.beginDraw();
	oCanvas.stroke(0);
	oCanvas.noFill();
	oCanvas.line(oPMousePosition.x, oPMousePosition.y, mouseX, mouseY);
	oCanvas.noStroke();
	oCanvas.fill(0);
	oCanvas.ellipse(mouseX, mouseY, 5, 5);
	oCanvas.endDraw();
}

