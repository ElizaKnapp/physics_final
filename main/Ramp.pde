public class Ramp {
  // it will always be in the same place
  float yRPos;
  int x1;
  int x2; 
  int y1;
  int y2;
  float angle;
  
  Ramp(int x1pos, int x2pos, int y1pos, int y2pos) {
    x1 = x1pos;
    x2 = x2pos; 
    y1 = y1pos; 
    y2 = y2pos;
    
    print("creating ramp");
    print(x1);
    print(x2);
    print(y1);
    print(y2);
    if (x2 != x1){
      angle = atan2(y1 - y2, x2 - x1);
      angle = degrees(angle);
      print(angle);
    }
    else angle = 0;
    //350, 600, 450, 250
  }
  
  void display() {
    //triangle(350, 450, 600, 250, 600, 450);
    triangle(x1, y1, x2, y2, x2, y1);
  } 
  
  int change_angle(float a) {
    // adjust all the variables accordingly with the new angle
    angle = a;
    println(y1);
    println(y2);
    println((x1 - x2) * tan(radians(angle)));
    y2 = int(y1 + (x1 - x2) * tan(radians(angle)));
    return y2;
  }
  
  boolean inelasticC (Candy c) {
    // PROBLEM: the 730!
    float slope = (float(y1) - float(y2)) / (float(x1) - float(x2));
    yRPos = slope * (c.xPos - x1) + y1;
    float d = dist(c.xPos, yRPos, c.xPos, c.yPos);
    if (angle < 40 && d <= 6 && c.xPos >= 350) {
      return true;
    } else if (angle < 60 && angle >= 40 && d <= 20 && c.xPos >= 350) {
      return true;
    } else if (angle < 70 && angle >= 60 && d <= 40 && c.xPos >= 350) {
      return true;
    } else {
      return false;
    }
    
  }
}
