PImage particle;

int resize = 4;

void setup() {
  // renderer must be set to P2D or P3D
  size(800, 600, P2D);

  blendMode(ADD);

  particle = loadImage("particle.png");

  background(0);
}

void draw() {
}

void mousePressed() {
  drawParticle();
}

void mouseDragged() {
  drawParticle();
}

void keyPressed() {
  if (key == ' ') {
    background(0);
  }
}

void drawParticle() {
  imageMode(CENTER);
  image(particle, mouseX, mouseY, particle.width / resize, particle.height / resize);
}

