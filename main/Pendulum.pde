public class Pendulum {
   int xPos;
   int yPos;
   Rope r;
   Candy c;
   Platform plat;
   Ramp ramp;
   float curr_angle; // current angle from the center
   float first_angle = 0.0; // angle when candy is first cut
   float a_acc = 0; // current acceleration
   float a_vel = 0; // current velocity
   // starts on jupiter
   float g;
   boolean attached = true;
   float s_end_x;
   float s_end_y;
   float damp_const = .9983;
   boolean isntCalled = true;
   float v_xtemp; 
   boolean friction = false; // CHANGE AT ANOTHER TIME
   boolean hit_ramp;
   
   
   Pendulum(int x, int y, float l, float angle, Platform pl, Ramp ra, PImage p, int gr, float m) {
     // creates a pendulum given the x and y pos and the length of the rope
     // the angle is the ANGLE FROM THE CENTER (negative if to the left, positive if to the right)
     xPos = x;
     yPos = y;
     r = new Rope(l, angle);
     c = new Candy(x, y, l, angle, p, m);
     curr_angle = r.angle;
     first_angle = curr_angle;
     s_end_x = c.xPos;
     s_end_y = c.yPos;
     if (l < 80) damp_const = .994;
     else if (l < 100) damp_const = 0.997;
     else if (l < 140) damp_const = 0.998;
     g = gr;
     plat = pl;
     ramp = ra;
     hit_ramp = false;
   }
   
   void display() {
     // the string
     if (r.vis) line(xPos, yPos, s_end_x, s_end_y);
     
     fill(#3A7FDE);
     // the top of the pendulum
     ellipse(xPos, yPos, 20, 20);
     
     fill(#F57474);
     // display the candy
     c.display();

   }
  
   float detatchAngle() {
     if (!attached && isntCalled == true){
        first_angle = curr_angle;
        isntCalled = false;
     }
     return first_angle;
   }
   
   void move() {
      if (attached) {
        if (sin(radians(curr_angle)) >= 0) c.xPos = xPos + floor(r.len * sin(radians(curr_angle)));
        else c.xPos = xPos + ceil(r.len * sin(radians(curr_angle)));
        if (cos(radians(curr_angle)) >= 0) c.yPos = yPos + floor(r.len * cos(radians(curr_angle)));
        else c.yPos = yPos + ceil(r.len * cos(radians(curr_angle)));
        s_end_x = c.xPos;
        s_end_y = c.yPos;
        
        a_acc = -1 * g * sin(radians(curr_angle)) / (float)(r.len);
        curr_angle += a_vel;
        a_vel += a_acc;
        a_vel *= damp_const; // lol...

      } else {

        c.move(g);
        if (plat.inelasticC(c) ) {
          c.v_y = 0;
          if (detatchAngle() < 0 && a_vel < 0) {
            //println("on left go up");
            // if it's on the left and it's going up
            c.v_x = -1 * abs(c.v_net * cos(radians(detatchAngle())));
          }
          else if (detatchAngle() < 0 && a_vel >= 0) {
            //println("on left go down");
            // if it's on the left and it's going down
            c.v_x = abs(c.v_net * cos(radians(detatchAngle())));
          }
          else if (detatchAngle() >= 0 && a_vel >= 0) {
            //println("on right go up");
            // if it's on the right and it's going up
            c.v_x = abs(c.v_net * cos(radians(detatchAngle())));
          } 
          else {
            //println("on right go down");
            // if it's on the right and it's going down 
            c.v_x = -1 * abs(c.v_net * cos(radians(detatchAngle())));
          }
        }
        else if (ramp.inelasticC(c)) {
          // change the angle stuff ONCE here
          // hehehe inelastic!
          if (!hit_ramp) {
            c.v_y = 0;
            c.v_y = 0;
            c.v_net = 0;
            hit_ramp = true;
          }
          // set the v x and vy accordinly
          c.move_ramp(g, ramp, friction);
        }
        r.vis = false;
      }
   }
   
   float velocity(){
     return c.velocity();
   }
   
   void split() {
     attached = false;
     s_end_x = c.xPos;
     s_end_y = c.yPos;
     // here, calculate net x velocity and net y velocity
     float v_net = a_vel * r.len;
     float v_x, v_y;
     if (curr_angle < 0 && a_vel < 0) {
       println("on left go up");
       // if it's on the left and it's going up
       v_x = -1 * abs(v_net * cos(radians(curr_angle)));
       v_y = -1 * abs(v_net * sin(radians(curr_angle)));  
     } else if (curr_angle < 0 && a_vel >= 0) {
       println("on left go down");
       // if it's on the left and it's going down
       v_x = abs(v_net * cos(radians(curr_angle)));
       v_y = abs(v_net * sin(radians(curr_angle)));  
     } else if (curr_angle >= 0 && a_vel >= 0) {
       println("on right go up");
       // if it's on the right and it's going up
       v_x = abs(v_net * cos(radians(curr_angle)));
       v_y = -1 * abs(v_net * sin(radians(curr_angle)));  
     } else {
       println("on right go down");
       // if it's on the right and it's going down
       v_x = -1 * abs(v_net * cos(radians(curr_angle)));
       v_y = abs(v_net * sin(radians(curr_angle)));  
     }

     c.detatch(v_x, v_y);
   }
}
