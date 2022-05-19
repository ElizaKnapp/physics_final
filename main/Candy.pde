public class Candy {
  int xPos;
  int yPos;
  int v_net; 
  
  Candy(int x, int y, int l, int angle) {
    // the initial x and y position are calculated from pendulum's root and rope vars
    xPos = x + (int)(l * sin(radians(angle)));
    yPos = y + (int)(l * cos(radians(angle))); // it's + because in processing, the top left corner is 0,0
  }
}
