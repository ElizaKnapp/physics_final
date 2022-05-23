PImage o_open, o_closed;
Pendulum p;
OmNom o;
int rounds = 0; // this is the amount of rounds that have passed to calculuate when omnom's mouth is open


public void settings() {
  size(600, 600);
}

void setup() {
  background(#B79D85);
  loadImages();
  p = new Pendulum(200, 200, 100, -30);
  o = new OmNom(o_open, o_closed);
}

void draw() {
  // wipe background
  background(#B79D85);
  
  // move and then display the pendulum
  p.move();
  p.display();
  o.display();
  if (rounds % 20 == 0) {
    o.change();
  }
  rounds++;
}

void loadImages() {
  o_closed = loadImage("closed.png");
  o_open = loadImage("open.png");
}
