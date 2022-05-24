public class Candy {
  int xPos;
  int yPos;
  int v_net; // idk if we need this yet
  
  Candy(int x, int y, float l, float angle) {
    // the initial x and y position are calculated from pendulum's root and rope vars
    xPos = x + (int)(l * sin(radians(angle)));
    yPos = y + (int)(l * cos(radians(angle))); // it's + because in processing, the top left corner is 0,0
  }
  
  void display() {
    ellipse(xPos, yPos, 30, 30);
  }
}
