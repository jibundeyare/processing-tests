/**
 * requirement :
 * - processing 2.2.1
 */

PGraphics oCanvas;

void setup() {
	size(800, 600, P3D);
	oCanvas = createGraphics(width, height);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
	if (pmouseX != 0 && pmouseY != 0) {
		drawMouseVector();
		image(oCanvas, 0, 0);
	}
}

void drawMouseVector() {
	oCanvas.beginDraw();
	oCanvas.stroke(0);
	oCanvas.noFill();
	oCanvas.line(pmouseX, pmouseY, mouseX, mouseY);
	oCanvas.noStroke();
	oCanvas.fill(0);
	oCanvas.ellipse(mouseX, mouseY, 5, 5);
	oCanvas.endDraw();
}

