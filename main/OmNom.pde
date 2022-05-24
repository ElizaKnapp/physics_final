public class OmNom {
  boolean open;
  PImage o, c;
  boolean eating = false;
  
  OmNom(PImage op, PImage cl) {
    o = op;
    c = cl;
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
  
  void display() {
    if (eating) {
      // insert the gif here
    } else {
      if (open) { 
        image(o, 500, 500, 100, 100);
      } else {
        image(c, 500, 500, 100, 100);
      }
    }
    
  }
  
  
}
