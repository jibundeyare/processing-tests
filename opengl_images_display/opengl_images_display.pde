/**
 * requirement :
 * - processing 1.5.1
 */

import processing.opengl.*;

final int SIZE_WIDTH = 1580;
final int SIZE_HEIGHT = 860;

void setup() {
	size(SIZE_WIDTH, SIZE_HEIGHT, OPENGL);
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);
}

