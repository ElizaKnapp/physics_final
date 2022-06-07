public class OmNom {
  boolean open;
  boolean sad = false;
  PImage o, c, s, choke;
  PImage[] e = new PImage[16];
  // CREATE CHOKING PICS HERE
  boolean eating = false;
  boolean choking = false;
  int frame = 0;
  int xPos = 550;
  int yPos = 550;
  float choking_v = 600;
  
  OmNom(PImage op, PImage cl, PImage sa, PImage[] eat, int x, int y, PImage ch) {
    o = op;
    c = cl;
    s = sa;
    e = eat;
    open = false;
    xPos = x;
    yPos = y;
    choke = ch;
  }
  
  void next_img() {
    frame ++;
    frame = frame % 16;
  }
  
  void check_eating_state(Candy c, boolean l2) {
    // omnom doesn't move!
    float d = dist(xPos, yPos, c.xPos, c.yPos);
    // if it's close enough, make omnom eat
    if (d <= 40) {
      print(c.v_net);
      if (l2 && (c.v_net > choking_v || (c.mass > 200 && c.v_net > choking_v - 200))) {
        choking = true;
        c.vis = false;
      } else {
        eating = true;
        c.vis = false;
      }
    } else if (d <= 175) {
      // if it gets close
      open = true;
    } else if (open && d > 175) {
      open = false;
      sad = true;
      // insert sad face here!
    } else if (c.yPos > 600) {
      sad = true;
    }
  }
  
  float dist(float x1, float y1, float x2, float y2) {
     float x = (x1 - x2) * (x1 - x2);
     float y = (y1 - y2) * (y1 - y2);
     return sqrt(x + y);
  }
 
  
  void display() { 
    if (choking) {
      image(choke, xPos - 50, yPos - 50, 100, 100);
    }
    else if (eating) {      
      image(e[frame], xPos - 50, yPos - 50, 100, 100);
    } else {
      if (open) { 
        image(o, xPos - 50, yPos - 50, 100, 100);
      } else if (sad){
        image(s, xPos - 50, yPos - 50, 100, 100);
      } else {
        image(c, xPos - 50, yPos - 50, 100, 100);
      }
    }
  }
}
