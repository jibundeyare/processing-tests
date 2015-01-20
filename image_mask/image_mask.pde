/**
 * requirement :
 * - processing 2.2.1
 */

PImage oBackground;
PImage oPoster;
PGraphics oMask;
PVector oPosition;

void setup() {
	size(800, 600, P3D);

	oBackground = loadImage("background1.jpg");
	oPoster = loadImage("poster01.jpg");
	oMask = createGraphics(oPoster.width, oPoster.height);
	prepareMask();
	oPosition = new PVector(width / 2 - oPoster.width / 2, height / 2 - oPoster.height / 2);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	drawBackground();
	drawPosters();
}

void keyPressed() {
    if (key == ' ') {
        // reset
        prepareMask();
    }
}

void mouseDragged() {
	drawOnMask();
}

void prepareMask() {
	oMask.beginDraw();
	oMask.noStroke();
	oMask.fill(255);
	oMask.rect(0, 0, oPoster.width, oPoster.height);
	oMask.endDraw();
}

void drawBackground() {
	background(200);
	image(oBackground, 0, 0, width, height);
}

void drawPosters() {
	int iIndex, x, y;

	oPoster.mask(oMask);
	image(oPoster, oPosition.x, oPosition.y);
}

void drawOnMask() {
	PVector oPosterCoordinate = globalCoordinateToPosterCoordinate(pmouseX, pmouseY, oPosition);

	oMask.beginDraw();
	oMask.noStroke();
	oMask.fill(0);
	oMask.rect(oPosterCoordinate.x, oPosterCoordinate.y, 10, 10);
	oMask.endDraw();
}

PVector globalCoordinateToPosterCoordinate(int x, int y, PVector oPosterPosition) {
	PVector oPosterCoordinate = new PVector();

	oPosterCoordinate.x = x - oPosterPosition.x;
	oPosterCoordinate.y = y - oPosterPosition.y;

	return oPosterCoordinate;
}

