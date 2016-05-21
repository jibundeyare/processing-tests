PImage particle;

int resize = 4;

void setup() {
  // any renderer works
  size(800, 600);

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
  blend(particle, 0, 0, particle.width, particle.height, mouseX - particle.width / resize / 2, mouseY - particle.height / resize / 2, particle.width / resize, particle.height / resize, ADD);
}

