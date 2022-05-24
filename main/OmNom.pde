public class OmNom {
  boolean open;
  PImage o, c;
  PImage[] e = new PImage[16];
  boolean eating = false;
  int frame = 0;
  
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
