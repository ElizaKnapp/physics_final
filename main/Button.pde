public class Button {
  boolean clicked;
  int xPos;
  int yPos;
  int r;
  color c;
  String name;
  
  
  Button(int x, int y, color col, int size, String n) {
    xPos = x;
    yPos = y;
    c = col;
    r = size;
    name = n;
  }
  
  void display() {
    fill(c);
    ellipse(xPos, yPos, r, r);
    fill(0);
    textAlign(CENTER);
    text(name, xPos, yPos);
  }
  
  boolean on_button(int x, int y) {
    return (sq(x - xPos) + sq(y - yPos) <= sq(r));
  }

}
