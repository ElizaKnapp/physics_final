PImage o_open, o_closed, o_sad;
PImage[] o_eating = new PImage[16];
Pendulum p;
OmNom o;
int rounds = 0; // this is the amount of rounds that have passed to calculuate when omnom's mouth is open
boolean cut_yet = false;

public void settings() {
  size(600, 600);
}

void setup() {
  // frameRate(10);
  background(#B79D85);
  loadImages();
  p = new Pendulum(200, 200, 200, 90);
  o = new OmNom(o_open, o_closed, o_sad, o_eating);
}

void draw() {
  // wipe background
  background(#B79D85);
  
  // omnom's picture
  o.check_eating_state(p.c);
  o.display();
  
  // move and then display the pendulum
  p.move();
  p.display();
  
  if (rounds % 2 == 0) {
    o.next_img();
  }
  
  /*
  if (rounds % 20 == 0) {
    o.change();
  }
  */
  rounds++;
  
}

void loadImages() {
  o_closed = loadImage("closed.png");
  o_open = loadImage("open.png");
  o_sad = loadImage("sad.png");
  for (int i = 0; i < 16; i++) {
      String img_name = str(i + 1) + ".png";
      o_eating[i] = loadImage(img_name);
  }
}

void keyPressed() {
  // here is the cutting the rope part
  if (key == ' ' && !cut_yet) {
     p.split();
     cut_yet = true;
  }
}
