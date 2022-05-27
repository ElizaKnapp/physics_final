public class OmNom {
  boolean open;
  boolean sad = false;
  PImage o, c, s;
  PImage[] e = new PImage[16];
  boolean eating = false;
  int frame = 0;
  int xPos = 550;
  int yPos = 550;
  
  OmNom(PImage op, PImage cl, PImage sa, PImage[] eat) {
    o = op;
    c = cl;
    s = sa;
    e = eat;
    open = false;
  }
  
  /*
  void open(){
    open = true;
  }
  
  void closed() {
    open = false;
  }
  
  void change() {
    if (open) {
      open = false;
     } else {
      open = true;
      }
   }
  
  void eat_mode() {
    eating = true;
  }
  
  void stop_eating() {
    eating = false;
  }
  
  void change_eating() {
     if (eating) {
      eating = false;
     } else {
      eating = true;
     }
  }
  */
  
  void next_img() {
    frame ++;
    frame = frame % 16;
  }
  
  void check_eating_state(Candy c) {
    // omnom doesn't move!
    float d = dist(xPos, yPos, c.xPos, c.yPos);
    // if it's close enough, make omnom eat
    if (d <= 40) {
      eating = true;
      c.vis = false;
      // todo later: at some pt, move to the next level...
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
    if (eating) {      
      image(e[frame], 500, 500, 100, 100);
    } else {
      if (open) { 
        image(o, 500, 500, 100, 100);
      } else if (sad){
        image(s, 500, 500, 100, 100);
      } else {
        image(c, 500, 500, 100, 100);
      }
    }
  }
}
