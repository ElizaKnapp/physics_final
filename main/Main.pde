PImage o_open, o_closed, o_sad;
PImage[] o_eating = new PImage[16];
Pendulum p;
OmNom o;
int rounds = 0; // this is the amount of rounds that have passed to calculuate when omnom's mouth is open
boolean cut_yet = false;
Button len, restart;
int rope_length = 200;
boolean round = true;

public void settings() {
  size(600, 600);
}

void setup() {
  // frameRate(10);
  background(#B79D85);
  loadImages();
  p = new Pendulum(200, 200, rope_length, 90);
  o = new OmNom(o_open, o_closed, o_sad, o_eating);
  len = new Button(100, 500, color(255,0,0), 50, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 50, "Restart"); 
}

void reset_vars() {
  background(#B79D85);
  p = new Pendulum(200, 200, rope_length, 90);
  o = new OmNom(o_open, o_closed, o_sad, o_eating);
  len = new Button(100, 500, color(255,0,0), 50, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 50, "Restart"); 

}

void draw() {
  // wipe background
  background(#B79D85);
   
  // display the buttons
  len.display();
  restart.display();
  
  // omnom's picture
  o.check_eating_state(p.c);
  o.display();
  
  // move and then display the pendulum
  p.move();
  p.display();
  
  if (p.c.xPos > 600) round = false;
  
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

void mouseClicked() {
  if (len.on_button(mouseX, mouseY)) {
    if (round) {
      rope_length -= 50;
      rounds = 0;
      reset_vars();
    }
  }
  if (restart.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    cut_yet = false;
    round = true;
    reset_vars();
  }
  
}
