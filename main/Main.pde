Pendulum p;

public void settings() {
  size(600, 600);
}

void setup() {
  background(#B79D85);
  p = new Pendulum(200, 200, 100, -30);
}

void draw() {
  // wipe background
  background(#B79D85);
  
  // move and then display the pendulum
  p.move();
  p.display();
}
