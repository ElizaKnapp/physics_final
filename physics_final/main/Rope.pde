public class Rope {
  float tension;
  float len;
  float angle; // in degrees for now, it is from the center, negative is to the left, positive is to the right
  boolean vis = true;
  
  Rope(float l, float a) {
    // right now, tension isn't relevant, later I will add it
    len = l;
    angle = a;
  }
}
