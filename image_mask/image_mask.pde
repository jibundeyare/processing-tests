/**
 * requirement :
 * - processing 1.5.1
 */

import processing.opengl.*;

PImage oPoster;
PVector oPosition;
PGraphics oMask;
PImage oBackground;

void setup() {
	size(800, 600, OPENGL);

	oPoster = loadImage("poster01.jpg");
	oPosition = new PVector(width / 2 - oPoster.width / 2, height / 2 - oPoster.height / 2);
	oBackground = loadImage("background1.jpg");
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	drawBackground();
	drawPosters();
}

void drawBackground() {
	background(200);
	image(oBackground, 0, 0, width, height);
}

void drawPosters() {
	int iIndex, x, y;

	image(oPoster, oPosition.x, oPosition.y);
}

