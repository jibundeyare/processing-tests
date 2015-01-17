/**
 * requirement :
 * - processing 1.5.1
 */

import processing.opengl.*;

final int SIZE_WIDTH = 1580;
final int SIZE_HEIGHT = 860;

final int IMAGE_WIDTH = 322;
final int IMAGE_HEIGHT = 400;

final int MARGIN = 10;
final int LEFT_LIMIT = MARGIN;
final int RIGHT_LIMIT = SIZE_WIDTH - (MARGIN + IMAGE_WIDTH);
final int TOP_LIMIT = MARGIN;
final int BOTTOM_LIMIT = SIZE_HEIGHT - (MARGIN + IMAGE_HEIGHT);

String[] aPosters;
PImage[] oPosters;
PVector[] oPositions;
PImage oBackground;

void setup() {
	size(SIZE_WIDTH, SIZE_HEIGHT, OPENGL);

	aPosters = getPostersList();

	// sort posters
	aPosters = sort(aPosters);

	// shuffle posters
	Collections.shuffle(Arrays.asList(aPosters));

	oPosters = new PImage[aPosters.length];
	loadPosters(aPosters, oPosters);

	oPositions = new PVector[aPosters.length];
	setRandomPositions(oPositions);

	oBackground = loadImage("background1.jpg");
}

void draw() {
    frame.setTitle(int(frameRate) + " fps");
	background(200);

	image(oBackground, 0, 0, width, height);

	int iIndex;

	for (iIndex = 0; iIndex < aPosters.length; iIndex++) {
		image(oPosters[iIndex], oPositions[iIndex].x, oPositions[iIndex].y);
	}
}

String[] getPostersList() {
	java.io.File folder = new java.io.File(dataPath(""));
	java.io.FilenameFilter posterFilter = new java.io.FilenameFilter() {
		public boolean accept(File dir, String name) {
			return name.toLowerCase().startsWith("poster");
		}
	};
	return folder.list(posterFilter);
}

void loadPosters(String[] aPosters, PImage[] oPosters) {
	int iIndex;

	for (iIndex = 0; iIndex < aPosters.length; iIndex++) {
		oPosters[iIndex] = loadImage(aPosters[iIndex]);
	}
}

void setRandomPositions(PVector[] oPositions) {
	int iIndex;
	int x, y;

	for (iIndex = 0; iIndex < oPositions.length; iIndex++) {
		x = round(random(LEFT_LIMIT, RIGHT_LIMIT));
		y = round(random(TOP_LIMIT, BOTTOM_LIMIT));
		oPositions[iIndex] = new PVector(x, y);
	}
}

