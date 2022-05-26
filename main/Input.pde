public class Input {
  boolean vis = false; // if it is visible
  int w = 50;
  int h = 25;
  int xPos;
  int yPos;
  
  Input(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(xPos, yPos, w, h);
    rectMode(CORNER);
  }
  
}
