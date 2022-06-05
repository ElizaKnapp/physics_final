public class Input {
  boolean vis = false; // if it is visible
  int w = 50;
  int h = 25;
  int xPos;
  int yPos;
  String text = "";
  
  Input(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  void display() {
    fill(255);
    rect(xPos, yPos, w, h);
    fill(0);
    textAlign(LEFT);
    text(text, xPos + 5, yPos + 15);
  }
  
}
