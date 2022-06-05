public class Ramp {
  // it will always be in the same place
  float yRPos;
  int x1;
  int x2; 
  int y1;
  int y2;
  Ramp(int x1pos, int x2pos, int y1pos, int y2pos) {
    x1 = x1pos;
    x2 = x2pos; 
    y1 = y1pos; 
    y2 = y2pos;
    //350, 600, 450, 250
  }
  
  void display() {
    //triangle(350, 450, 600, 250, 600, 450);
    triangle(x1, y1, x2, y2, x2, y1);
  }
  
  boolean inelasticC (Candy c) {
    float slope = (float(y1) - float(y2)) / (float(x1) - float(x2));
    yRPos = slope * c.xPos + 730;
    float d = dist(c.xPos, yRPos, c.xPos, c.yPos);
    if (d <= 6 && c.xPos >= 350) {
      return true;
    }
      else{
        return false;
      }
  }
  
}
