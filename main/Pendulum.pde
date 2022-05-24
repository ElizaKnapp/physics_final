public class Pendulum {
   int xPos;
   int yPos;
   Rope r;
   Candy c;
   float curr_angle; // current angle from the center
   float a_acc = 0; // current acceleration
   float a_vel = 0; // current velocity
   float g = 9.81; // gravity- PROBLEM!! If you change gravity the dampening doesn't work in move
   boolean attached = true;
   float s_end_x;
   float s_end_y;
   
   
   Pendulum(int x, int y, float l, float angle) {
     // creates a pendulum given the x and y pos and the length of the rope
     // the angle is the ANGLE FROM THE CENTER (negative if to the left, positive if to the right)
     xPos = x;
     yPos = y;
     r = new Rope(l, angle);
     c = new Candy(x, y, l, angle);
     curr_angle = r.angle;
     s_end_x = c.xPos;
     s_end_y = c.yPos;
    
   }
   
   void display() {
     // the string
     line(xPos, yPos, s_end_x, s_end_y);
     
     fill(#3A7FDE);
     // the top of the pendulum
     ellipse(xPos, yPos, 20, 20);
     
     fill(#F57474);
     // display the candy
     c.display();

   }
  
   
   void move() {
      if (attached) {
        c.xPos = xPos + (int)(r.len * sin(radians(curr_angle)));
        c.yPos = yPos + (int)(r.len * cos(radians(curr_angle)));
        s_end_x = c.xPos;
        s_end_y = c.yPos;
        
        a_acc = -1 * g * sin(radians(curr_angle)) / (float)(r.len);
        curr_angle += a_vel;
        a_vel += a_acc;
        a_vel *= .9985; // lol...
      } else {
        c.move(g);
      }
      
   }
   
   void split() {
     attached = false;
     s_end_x = c.xPos;
     s_end_y = c.yPos;
     // here, calculate net x velocity and net y velocity
     float v_net = a_vel * r.len;
     float v_x, v_y;
     if (curr_angle < 0 && a_acc < 0) {
       // if it's on the left and it's going up
       v_x = -1 * abs(v_net * cos(radians(curr_angle)));
       v_y = -1 * abs(v_net * sin(radians(curr_angle)));  
     } else if (curr_angle < 0 && a_acc >= 0) {
       // if it's on the left and it's going down
       v_x = abs(v_net * cos(radians(curr_angle)));
       v_y = abs(v_net * sin(radians(curr_angle)));  
     } else if (curr_angle >= 0 && a_acc < 0) {
       // if it's on the right and it's going up
       v_x = abs(v_net * cos(radians(curr_angle)));
       v_y = -1 * abs(v_net * sin(radians(curr_angle)));  
     } else {
       // if it's on the right and it's going down
       v_x = -1 * abs(v_net * cos(radians(curr_angle)));
       v_y = abs(v_net * sin(radians(curr_angle)));  
     }

     c.detatch(v_x, v_y);
     print("split");
   }
}
