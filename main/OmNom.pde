public class OmNom {
  boolean open;
  PImage o, c;
  PImage[] e = new PImage[16];
  boolean eating = false;
  int frame = 0;
  int xPos = 550;
  int yPos = 550;
  int time_eating = -1; // 100 frames of eating
  
  OmNom(PImage op, PImage cl, PImage[] eat) {
    o = op;
    c = cl;
    e = eat;
    open = false;
  }
  
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
  
  void next_img() {
    frame ++;
    frame = frame % 16;
  }
  
  // void check_eating state
  // if touched, chew for a little bit (100 ticks?)
  // if close, open mouth
  // if close and then unclose, go to a sad face?
  void check_eating_state(Candy c) {
    // omnom doesn't move!
    if (dist(xPos, yPos, c.xPos, c.yPos) > 50 && time_eating < 0) {
      eating = false;
    } else {
      eating = true;
      time_eating -= 1;
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
      } else {
        image(c, 500, 500, 100, 100);
      }
    }
    
  }
  
  
}
