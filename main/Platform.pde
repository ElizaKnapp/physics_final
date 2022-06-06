public class Platform {
  int x1;
  int x2;
  int y1;
  int y2;
  //Candy c;
  //float v_y;
  
  Platform (int x1pos, int y1pos, int x2pos, int y2pos){
    x1 = x1pos;
    y1 = y1pos;
    x2 = x2pos;
    y2 = y2pos;
  }
  
  void display() {
    fill (#369299);
    rect (x1, y1, x2, y2);
  }
  
  boolean inelasticC (Candy c) {
    float d = dist(c.xPos, y1, c.xPos, c.yPos);
    return (d <= 5 && c.xPos <= x2);
  }
  
}
