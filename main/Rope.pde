public class Rope {
  int tension;
  int len;
  float angle; // in degrees for now, it is from the center, negative is to the left, positive is to the right
  
  Rope(int l, float a) {
    // right now, tension isn't relevant, later I will add it
    len = l;
    angle = a;
  }
}
