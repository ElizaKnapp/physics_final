public class Button {
  boolean clicked=false;
  int xPos;
  int yPos;
  int r;
  color c;
  color og_c;
  String name = "";
  Input i;
  
  
  Button(int x, int y, color col, int size, String n) {
    xPos = x;
    yPos = y;
    c = col;
    og_c = col;
    r = size;
    name = n;
    i = new Input(xPos - r, yPos + r);
  }
  
  void display() {
    fill(c);
    ellipse(xPos, yPos, 2*r, 2*r);
    fill(255);
    textAlign(CENTER);
    text(name, xPos, yPos);
    if (clicked && !name.contains("Friction")) {
      i.display();
    }
  }
  
  void change_color(color col) {
    c = col;
  }
  
  boolean on_button(int x, int y) {
    return (sq(x - xPos) + sq(y - yPos) <= sq(r));
  }

}
