Pendulum p;

public void settings() {
  size(600, 600);
}

void setup() {
  background(#B79D85);
  p = new Pendulum(200, 200, 50, 0);
}

void draw() {
  p.display();
}
