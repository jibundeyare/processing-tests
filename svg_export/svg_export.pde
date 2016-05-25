/**
 * libraries:
 * - P8gGraphicsSVG library
 */

import org.philhosoft.p8g.svg.P8gGraphicsSVG;

boolean save = false;

void setup() {
	size(800, 600);
}

void draw() {
	background(255);

  fill(0);
  noStroke();
  ellipse(200, 200, 100, 100);

  // nothing will be exported to svg before this block
	if (save == true) {
		beginRecord(P8gGraphicsSVG.SVG, "data/export.svg");
	}

	translate(width / 2, height / 2);

  fill(0);
  noStroke();
  ellipse(0, 0, 300, 300);

  // nothing will be exported to svg after this block
	if (save == true) {
		endRecord();
		save = false;
	}
}

void mouseClicked() {
  save = true;
}

