public class Ramp {
  // it will always be in the same place
  Ramp() {
  }
  
  void display() {
    triangle(350, 450, 600, 250, 600, 450);
  }
  
  // find the ypos of the ramp at a given xpos of the candy
  
  
  boolean inelasticC (Candy c, float yRPos) { //inelastic collision with the platform, velocity is conserved
    yRPos = (.8 * c.xPos + 730); //might be -730?
    float d = dist(c.xPos, c.yPos, c.xPos, yRPos);
    if (d <= 3 && c.xPos >= 350) {
      return true;
    }
     else{
       return false;
     }
  }
  
}
