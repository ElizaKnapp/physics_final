public class Rope {
  int tension;
  int len;
  int angle; // in degrees for now, it is from the center, negative is to the left, positive is to the right
  
  Rope(int l, int a) {
    // right now, tension isn't relevant, later I will add it
    len = l;
    angle = a;
  }
}
