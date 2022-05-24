public class Candy {
  int xPos;
  int yPos;
  float v_x;
  float v_y;
  
  Candy(int x, int y, float l, float angle) {
    // the initial x and y position are calculated from pendulum's root and rope vars
    xPos = x + (int)(l * sin(radians(angle)));
    yPos = y + (int)(l * cos(radians(angle))); // it's + because in processing, the top left corner is 0,0
  }
  
  void display() {
    ellipse(xPos, yPos, 30, 30);
  }
  
  void detatch(float vx, float vy) {
    print("detatch");
    v_x = vx;
    v_y = vy;
    // then, somehow calculate the motion differently!
    // create a c_move function for when the candy moves on it's own
  }
  
  void move(float gravity) {
    // this only ever gets called if the candy is detached
    xPos += (int)(v_x / 100);
    yPos += (int)(v_y / 100);
    // v_y += gravity;
    
  }
}
