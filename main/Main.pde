Pendulum p;
int t; // in milliseconds!

public void settings() {
  size(600, 600);
}

void setup() {
  background(#B79D85);
  p = new Pendulum(200, 200, 100, -30);
}

void draw() {
  p.move(t);
  p.display();
}
