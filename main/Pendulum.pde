public class Pendulum {
   int xPos;
   int yPos;
   Rope s;
   Candy c;
   
   Pendulum(int x, int y, int l, int angle) {
     // creates a pendulum given the x and y pos and the length of the rope
     // the angle is the ANGLE FROM THE CENTER (negative if to the left, positive if to the right)
     xPos = x;
     yPos = y;
     s = new Rope(l, angle);
     c = new Candy(x, y, l, angle);
    
   }
}
