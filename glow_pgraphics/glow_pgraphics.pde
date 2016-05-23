PImage particle;
PGraphics pg;

boolean extraGlow = true;
int resize = 4;

void setup() {
  // renderer must be set to P2D or P3D
  size(800, 600, P2D);

  blendMode(ADD);

  particle = loadImage("particle.png");

  if (extraGlow) {
    pg = createGraphics(particle.width / resize, particle.height / resize, P2D);
  } else {
    pg = createGraphics(particle.width / resize, particle.height / resize);
  }

  pg.beginDraw();
  pg.image(particle, 0, 0, particle.width / resize, particle.height / resize);
  pg.endDraw();

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
  image(pg, mouseX, mouseY, pg.width, pg.height);
}

