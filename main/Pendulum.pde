public class Pendulum {
   int xPos;
   int yPos;
   Rope s;
   Candy c;
   float curr_angle;
   float angle_acc;
   float angle_vel;
   
   Pendulum(int x, int y, int l, int angle) {
     // creates a pendulum given the x and y pos and the length of the rope
     // the angle is the ANGLE FROM THE CENTER (negative if to the left, positive if to the right)
     xPos = x;
     yPos = y;
     s = new Rope(l, angle);
     c = new Candy(x, y, l, angle);
     curr_angle = s.angle;
    
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
      c.xPos = xPos + (int)(s.len * sin(radians(curr_angle)));
      c.yPos = yPos + (int)(s.len * cos(radians(curr_angle)));
 
      curr_angle -= 1;
   }
}
