PGraphics pg;

int auraRadius1 = 120;
int auraRadius2 = 80;
int auraRadius3 = 40;
int coreRadius = 20;

void setup() {
  size(256, 256);

  pg = createGraphics(width, height);

  pg.beginDraw();

  pg.ellipseMode(RADIUS);
  pg.noStroke();

  // draw aura 1
  pg.fill(255, 0, 0, 1);

  for (int r = 1; r <= auraRadius1; r++) {
    pg.ellipse(width / 2, height / 2, r, r);
  }

  // draw aura 2
  pg.fill(255, 127, 0, 1);

  for (int r = 1; r <= auraRadius2; r++) {
    pg.ellipse(width / 2, height / 2, r, r);
  }

  // draw aura 3
  pg.fill(255, 255, 0, 10);

  for (int r = 1; r <= auraRadius3; r++) {
    pg.ellipse(width / 2, height / 2, r, r);
  }

  // draw core
  pg.fill(255);
  pg.ellipse(width / 2, height / 2, coreRadius, coreRadius);

  pg.endDraw();

  pg.save("data/particle.png");
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(pg, width / 2, height / 2, pg.width, pg.height);
}

