/**
 * requirement :
 * - processing 2.2.1
 */

void setup() {
	size(800, 600);
}

void draw() {
}

void mousePressed() {
	println("mousePressed");
}

void mouseReleased() {
	println("mouseReleased");
}

void mouseClicked() {
	println("mouseClicked");
}

void mouseMoved() {
	println("mouseMoved");
}

void mouseDragged() {
	println("mouseDragged");
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println("mouseWheel (" + String.valueOf(e) + ")");
}

