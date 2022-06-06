public class Candy {
  int xPos;
  int yPos;
  float v_x;
  float v_y;
  float v_net;
  boolean vis = true;
  PImage pic;
  float theta;
  float mass;
  
  Candy(int x, int y, float l, float angle, PImage p, float m) {
    // the initial x and y position are calculated from pendulum's root and rope vars
    xPos = x + (int)(l * sin(radians(angle)));
    yPos = y + (int)(l * cos(radians(angle))); // it's + because in processing, the top left corner is 0,0   
    pic = p;
    mass = m;
  }
  
  void display() {
    if (vis) {
      // this 30 is the entire length, not the radius!
      // ellipse(xPos, yPos, 30, 30);
      imageMode(CENTER);
      image(pic, xPos, yPos, 30, 30);
      imageMode(CORNER);
    }
  }
  
  void detatch(float vx, float vy) {
    v_x = vx;
    v_y = vy;
    v_net = sqrt(pow(v_x,2) + pow(v_y, 2));
    // then, somehow calculate the motion differently!
    // create a c_move function for when the candy moves on it's own
  }
  
  void move(float gravity) {
    // this only ever gets called if the candy is detached
    xPos += (int)(v_x / 100);
    yPos += (int)(v_y / 100);
    v_y += gravity;

  }
  
  void move_ramp(float gravity, Ramp ramp, float friction) {
    // the v_net now is in the correct direction! now... 
    v_x = -1 * v_net * cos(radians(ramp.angle));
    v_y = v_net * sin(radians(ramp.angle));
    xPos += (int)(v_x / 100); // minus cuz down the ramp lol
    yPos += (int)(v_y / 100);
    v_net += (mass * gravity * sin(radians(ramp.angle))/ 50);
    
  }
}
