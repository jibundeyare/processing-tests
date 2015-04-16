/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;
int iHalfWidth = 10;
PVector myPMouse;
int threshold = 40;

void setup() {
	size(800, 600, P3D);
	oCanvas = createGraphics(width, height);
	myPMouse = new PVector(mouseX, mouseY);
}

void draw() {
	frame.setTitle(int(frameRate) + " fps");
	background(200);
	image(oCanvas, 0, 0);
}

void mouseDragged() {
	if (dist(mouseX, mouseY, myPMouse.x, myPMouse.y) >= threshold) {
		myMouseDragged();
		myPMouse.x = mouseX;
		myPMouse.y = mouseY;
	}
}

void mousePressed() {
	myPMouse.x = mouseX;
	myPMouse.y = mouseY;
}

void myMouseDragged() {
	if (myPMouse.x != 0 && myPMouse.y != 0) {
		drawStrip();
	}
}

void keyPressed() {
	if (key == ' ') {
		clearCanvas();
	}
}

PVector getMouseVector() {
	return new PVector(mouseX - myPMouse.x, mouseY - myPMouse.y);
}

void clearCanvas() {
	oCanvas.clear();
	oCanvas.beginDraw();
	oCanvas.endDraw();
}

void drawStrip() {
	PVector oMouseVector = getMouseVector();

	oCanvas.beginDraw();
	oCanvas.pushMatrix();
	oCanvas.translate(myPMouse.x, myPMouse.y);
	oCanvas.rotate(oMouseVector.heading());
	oCanvas.strokeCap(ROUND);
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

