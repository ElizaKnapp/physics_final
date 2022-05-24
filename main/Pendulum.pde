public class Pendulum {
   int xPos;
   int yPos;
   Rope r;
   Candy c;
   float curr_angle; // current angle from the center
   float a_acc = 0; // current acceleration
   float a_vel = 0; // current velocity
   float g = 9.81; // gravity- PROBLEM!! If you change gravity the dampening doesn't work in move
   
   Pendulum(int x, int y, float l, float angle) {
     // creates a pendulum given the x and y pos and the length of the rope
     // the angle is the ANGLE FROM THE CENTER (negative if to the left, positive if to the right)
     xPos = x;
     yPos = y;
     r = new Rope(l, angle);
     c = new Candy(x, y, l, angle);
     curr_angle = r.angle;
    
   }
   
   void display() {
     // the string
     line(xPos, yPos, c.xPos, c.yPos);
     
     fill(#3A7FDE);
     // the top of the pendulum
     ellipse(xPos, yPos, 20, 20);
     
     fill(#F57474);
     // display the candy
     c.display();
   }
  
   
   void move() {
      c.xPos = xPos + (int)(r.len * sin(radians(curr_angle)));
      c.yPos = yPos + (int)(r.len * cos(radians(curr_angle)));
      
      a_acc = -1 * g * sin(radians(curr_angle)) / (float)(r.len);
      curr_angle += a_vel;
      a_vel += a_acc;
      a_vel *= .9985; // lol...
      
   }
}
