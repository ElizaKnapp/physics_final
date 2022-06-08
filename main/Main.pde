PImage o_open, o_closed, o_sad, candy_pic, rocket, jupiter, choking_omnom;
PImage[] o_eating = new PImage[16];
Pendulum p;
OmNom o;
Platform plat;
Ramp ramp;
int rounds = 0; // this is the amount of rounds that have passed to calculuate when omnom's mouth is open
boolean cut_yet = false;
Button len, restart, gravity, level2, level1, angle, mass_b, friction;
int rope_length = 200;
boolean round = true;
boolean won;
String message = "You have been placed on Jupiter to feed a cute alien" + '\n' + "in a rocketship. Click the space key to cut the rope.";
int g = 25;
int space = 0; // the amount of time it is in space
boolean l2 = false;
float mass = 100; // mass of the candy
int ramp_y2 = 250; // starting y2 (will change later!)
boolean friction_on = false;

public void settings() {
  size(600, 600);
}

void setup() {
  //frameRate(10);
  background(#B79D85);
  loadImages();
  plat = new Platform(0,0,0,0);
  ramp = new Ramp (0,0,0,0);
  p = new Pendulum(200, 200, rope_length, 90, plat, ramp, candy_pic, g, mass); //added plat
  o = new OmNom(o_open, o_closed, o_sad, o_eating, 550, 550, choking_omnom);
  len = new Button(100, 500, color(255,0,0), 25, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 25, "Restart"); 
  gravity = new Button(150, 500, color(100, 100, 0), 25, "Gravity");
  level1 = new Button(50, 50, color(0, 100, 100), 35, "Level 1");
  level2 = new Button(550, 50, color(0, 100, 100), 35, "Level 2");
  won = false;
}

void reset_vars() {
  background(#B79D85);
  plat = new Platform(0,0,0,0);
  ramp = new Ramp(0, 0, 0, 0);
  p = new Pendulum(200, 200, rope_length, 90, plat, ramp, candy_pic, g, mass); //added plat
  o = new OmNom(o_open, o_closed, o_sad, o_eating, 550, 550, choking_omnom);
  len = new Button(100, 500, color(255,0,0), 25, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 25, "Restart"); 
  gravity = new Button(150, 500, color(100, 100, 0), 25, "Gravity");
  level1 = new Button(50, 50, color(0, 100, 100), 35, "Level 1");
  level2 = new Button(550, 50, color(0, 100, 100), 35, "Level 2");
  won = false;
}

void setup2() {
  background(#B79D85);
  plat = new Platform(0,350,300,20);
  ramp = new Ramp(350, 600, 450, ramp_y2);
  p = new Pendulum(200, 100, rope_length, 90, plat, ramp, candy_pic, g, mass); //added plat
  o = new OmNom(o_open, o_closed, o_sad, o_eating, 300, 550, choking_omnom);
  len = new Button(100, 500, color(255,0,0), 25, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 25, "Restart"); 
  gravity = new Button(150, 500, color(100, 100, 0), 25, "Gravity");
  angle = new Button(50, 550, color(100, 0, 100), 25, "Angle");
  mass_b = new Button(100, 550, color(0, 100, 100), 25, "Mass");
  friction = new Button(150, 550, color(100, 50, 180), 25, "Friction" + "\n" + "Off");
  level1 = new Button(50, 50, color(0, 100, 100), 35, "Level 1");
  level2 = new Button(550, 50, color(0, 100, 100), 35, "Level 2");
  won = false;  
  l2 = true;
    
  // HERE GOES ALL THE INITIALIZATIONS SPECIFIC TO LEVEL 2
}

void draw() {
  if (space > 0) {
    space --;
    background(0);
    image(rocket, 200, 200, 200, 200);
    image(jupiter, -40, 470, 200, 200);
    textSize(20);
    textAlign(CENTER);
    fill(color(255));
    text("The space ship travels away from Jupiter so the" +
    "\n" + "acceleration due to gravity decreases." + "\n" 
    + "We ARE physically accurate!", 300, 100);
    textSize(12);
    
  } else {
  
  // wipe background
  background(#B79D85);
  
  if (l2) {
    // HERE GOES ALL THINGS LEVEL 2 RELATED
    ramp.display();
    plat.display();
    textSize(20);
    fill(#08d1b3);
    text("choking velocity: " + "600" + " m/s",490,60);
    textSize(12);
    fill(#F57474);
    
    // display the level 2 message
    textSize(20);
    textAlign(LEFT);
    if (message.contains("Jupiter") || message.contains("rocket") || message.contains("pendulum") 
    || message.contains("Good work!") || message.contains("LEVEL 2") || message.contains("play level 1")
    || message.contains("candy mass") || message.contains("ramp has changed") || message.contains("input: len")
    || message.contains("masses from 10 to 300 kgs") || message.contains("input: angles 10 to 70 degrees")
    || message.contains("Friction")){
      fill(color(0, 255, 0));
    }
    else fill(color(255,0,0));
    if (message.contains("finished the game")) text(message, 100, 50);
    else text(message, 20, 50);
    textSize(15);
    fill(color(0, 0, 255));
    text("Make sure the velocity isn't" + "\n" + "too fast! Otherwise" + "\n" + 
     "OmNom will choke" + "\n" + "For larger masses,  he will" +
    "\n" + "choke at lower velocities" , 380, 500);
    textSize(12);
    // display the angle button
    angle.display();
    mass_b.display();
    friction.display();
    
    
    
  }
  
  if (!l2) {
    // display whatever the message is FOR LEVEL 1
    textSize(20);
    textAlign(LEFT);
    if (message.equals("input: lengths 50-300")) fill(color(0,255,0));
    else if (message.contains("Jupiter") || message.contains("rocket") || message.contains("pendulum") 
    || message.contains("Good work!") || message.contains("Welcome")) fill(color(0,255,0));
    else fill(color(255,0,0));
    text(message, 20, 100);
    textSize(12);
  }
   
  // display the buttons
  len.display();
  restart.display();
  gravity.display();
  if (!round && won) {
    if (l2) {
      level1.display();
      message = "You've finished the game!" + "\n" + "You can go back to play level 1 again now";
    } else {
      level2.display();
      message = "Good work! Click the button on the top right to" + "\n" + "proceed to the next level";
    }

  } 
  
  // omnom's picture
  o.check_eating_state(p.c, l2);
  if (o.choking) {
    message = "The velocity of the candy was too fast for that mass!" + "\n" + "OmNom choked!";
  }
  if (o.eating) {
    won = true;
    round = false;
  }
  o.display();
  
  // move and then display the pendulum
  p.move();
  p.display();
  
  // display the velocity of the candy
  textSize(20);
  fill(#08d1b3);
  text("current velocity: " + round(p.velocity()) + " m/s",490,30);
  textSize(12);
  fill(#F57474);
  
  if (p.c.xPos > 600) round = false;
  
  if (rounds % 2 == 0) {
    o.next_img();
  }
  
  rounds++;
  }
  
}

void loadImages() {
  o_closed = loadImage("closed.png");
  o_open = loadImage("open.png");
  o_sad = loadImage("sad.png");
  for (int i = 0; i < 16; i++) {
      String img_name = "eating" + str(i + 1) + ".png";
      o_eating[i] = loadImage(img_name);
  }
  candy_pic = loadImage("candy.png");
  rocket = loadImage("rocket.png");
  jupiter = loadImage("jupiter.png");
  choking_omnom = loadImage("choking.png"); 
}

void keyPressed() {
  // here is the cutting the rope part
  if (key == ' ' && !cut_yet) {
     p.split();
     cut_yet = true;
  }
  if (key != ' ') {
    if (len.clicked) {

      if (key == '\n' ) {
        try {
          int new_length = Integer.valueOf(len.i.text);
            if ( (new_length <= 300 && new_length >= 50 && !l2) || (new_length <= 200 && new_length >= 50 && l2)) {
              rope_length = new_length;
              message = "Notice how the period of the pendulum changes" + "\n" + "with the different length";
             } else {
               if (l2) message = "please input a length from 50 to 200";
               else message = "please input a length from 50 to 300";
             }
            rounds = 0;
            if (l2) setup2();
            else reset_vars();
        } catch (Exception e) {
          // continue to find problem
        }

         } else if (key==BACKSPACE){
           if (len.i.text.length() > 0) {
              len.i.text = len.i.text.substring(0, len.i.text.length() - 1);
           } else {
             len.i.text = "";
           }
          }
          else if (len.i.text.length() > 2) {
          message = "only 3 numbers";
          } else {
            if (key >= 48 && key <= 57) {
               if (key == 48 && len.i.text.length() == 0) message = "no 0 in the front";
                else len.i.text = len.i.text + key;
            } else {
              message = "numbers 0-9 only please";
        }
       }
    }
   else if (gravity.clicked) {
     if (key == '\n' ) {
       try {
        int grav = Integer.valueOf(gravity.i.text);
        if (grav <= 25 && grav >= 1) {
          g = grav;
          space = 300;
          message = "You have traveled through space, notice how the period" + "\n" + "of the pendulum changes.";
         } else message = "please input a gravity value from 1 to 25";
        rounds = 0;
        if (l2) setup2();
        else reset_vars();
       } catch (Exception e) {
         // move on to find the problem
       }
         } else if (key==BACKSPACE){
           if (gravity.i.text.length() > 0) {
              gravity.i.text = gravity.i.text.substring(0, gravity.i.text.length() - 1);
           } else {
             gravity.i.text = "";
           }
          }
          else if (gravity.i.text.length() > 1) {
          message = "only 2 numbers";
          } else {
            if (key >= 48 && key <= 57) {
               if (key == 48 && gravity.i.text.length() == 0) message = "no 0 in the front";
                else gravity.i.text = gravity.i.text + key;
            } else {
              message = "numbers 0-9 only please";
          }
       }
    } else if (angle.clicked) {

      if (key == '\n' ) {
        try {
          int new_angle = Integer.valueOf(angle.i.text);
            if (new_angle <= 70 && new_angle >= 10 && l2) {
              ramp_y2 = ramp.change_angle(new_angle);
              message = "The ramp has changed!";
             } else {
               if (l2) message = "please input an angle between 10 and 70 degrees";
             }
            rounds = 0;
            if (l2) setup2();
        } catch (Exception e) {
          // continue to find problem
        }

         } else if (key==BACKSPACE){
           if (angle.i.text.length() > 0) {
              angle.i.text = angle.i.text.substring(0, angle.i.text.length() - 1);
           } else {
             len.i.text = "";
           }
          }
          else if (angle.i.text.length() > 1) {
          message = "only 2 numbers";
          } else {
            if (key >= 48 && key <= 57) {
               if (key == 48 && angle.i.text.length() == 0) message = "no 0 in the front";
                else angle.i.text = angle.i.text + key;
            } else {
              message = "numbers 0-9 only please";
        }
       }
    } else if (mass_b.clicked) {

      if (key == '\n' ) {
        try {
          int new_mass = Integer.valueOf(mass_b.i.text);
            if (new_mass <= 300 && new_mass >= 10 && l2) { // RECONSIDER THESE BOUNDS
              mass = new_mass;
              message = "The candy mass has changed!";
             } else {
               if (l2) message = "please input a mass between 10 and 300 kgs";
             }
            rounds = 0;
            if (l2) setup2();
        } catch (Exception e) {
          // continue to find problem
        }

         } else if (key==BACKSPACE){
           if (mass_b.i.text.length() > 0) {
              mass_b.i.text = mass_b.i.text.substring(0, mass_b.i.text.length() - 1);
           } else {
             len.i.text = "";
           }
          }
          else if (mass_b.i.text.length() > 2) {
          message = "only 3 numbers";
          } else {
            if (key >= 48 && key <= 57) {
               if (key == 48 && mass_b.i.text.length() == 0) message = "no 0 in the front";
                else mass_b.i.text = mass_b.i.text + key;
            } else {
              message = "numbers 0-9 only please";
        }
       }
    }
   
  }
}

void mouseClicked() {
  if (len.on_button(mouseX, mouseY)) {
    if (round) {
      if (gravity.clicked){
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
      }
      if (l2 && angle.clicked) {
        angle.clicked = false;
        angle.change_color(angle.og_c);
      }
      if (l2 && mass_b.clicked) {
        mass_b.clicked = false;
        mass_b.change_color(mass_b.og_c);
      }
      if (l2 && friction.clicked) { 
        friction.clicked = false;
        friction.change_color(angle.og_c);
      }
      if (!len.clicked) {
        len.clicked = true;
        len.change_color(100);
        if (l2) message = "input: lengths 50-200";
        else message = "input: lengths 50-300";
      } else {
        len.clicked = false;
        len.change_color(len.og_c);
        len.i.text = "";
        message = "";
      }
    }
  }
  if (gravity.on_button(mouseX, mouseY)) {
    if (round) {
      if (len.clicked) {
        len.clicked = false;
        len.change_color(len.og_c);
      }
      if (l2 && angle.clicked) {
        angle.clicked = false;
        angle.change_color(angle.og_c);
      }
      if (l2 && mass_b.clicked) {
        mass_b.clicked = false;
        mass_b.change_color(mass_b.og_c);
      }
      if (l2 && friction.clicked) { 
        friction.clicked = false;
        friction.change_color(angle.og_c);
      }
      if (!gravity.clicked) {
        gravity.clicked = true;
        gravity.change_color(100);
        message = "Drive the rocket away from jupiter to adjust gravity" + '\n' + "Input values 1-25 m/s^2 for acc due to gravity";
      } else {  
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
        gravity.i.text = "";
        message = "";
      }
    }
  }
  if (l2 && angle.on_button(mouseX, mouseY)) {
    if (round) {
      if (len.clicked) {
        len.clicked = false;
        len.change_color(len.og_c);
      }
      if (gravity.clicked) {
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
      }
      if (l2 && mass_b.clicked) {
        mass_b.clicked = false;
        mass_b.change_color(mass_b.og_c);
      }
      if (l2 && friction.clicked) { 
        friction.clicked = false;
        friction.change_color(angle.og_c);
      }
      if (!angle.clicked) {
        angle.clicked = true;
        angle.change_color(100);
        if (l2) message = "input: angles 10 to 70 degrees";

      } else {
        angle.clicked = false;
        angle.change_color(angle.og_c);
        angle.i.text = "";
        message = "";
      }  
    }
  }

  if (l2 && mass_b.on_button(mouseX, mouseY)) {
    if (round) {
      if (len.clicked) {
        len.clicked = false;
        len.change_color(angle.og_c);
      }
      if (gravity.clicked) {
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
      }
      if (l2 && angle.clicked) { // ik l2 is redundant but this decreases my future copy paste errors lol
        angle.clicked = false;
        angle.change_color(angle.og_c);
      }
      if (l2 && friction.clicked) { 
        friction.clicked = false;
        friction.change_color(angle.og_c);
      }
      if (!mass_b.clicked) {
        mass_b.clicked = true;
        mass_b.change_color(100);
        if (l2) message = "input: masses from 10 to 300 kgs";
      } else {
        mass_b.clicked = false;
        mass_b.change_color(mass_b.og_c);
        mass_b.i.text = "";
        message = "";
      }  
    }
  }
  
  if (l2 && friction.on_button(mouseX, mouseY)) {
    if (round) {
      if (len.clicked) {
        len.clicked = false;
        len.change_color(angle.og_c);
      }
      if (gravity.clicked) {
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
      }
      if (l2 && angle.clicked) { // ik l2 is redundant but this decreases my future copy paste errors lol
        angle.clicked = false;
        angle.change_color(angle.og_c);
      }
      if (l2 && mass_b.clicked) {
        mass_b.clicked = false;
        mass_b.change_color(mass_b.og_c);
      }
      if (!friction.clicked) {
        friction.clicked = true;
        friction.change_color(100); // HERE FOR FRICTION IT WLD CHANGE TEXT TOO!!
        friction.name = "Friction" + "\n" + "On";
        p.friction = true;
        if (l2) message = "Friction is on! Notice the rolling";
      } else {
        friction.clicked = false;
        friction.change_color(friction.og_c);
        friction.name = "Friction" + "\n" + "Off";
        p.friction = false;
        message = "Friction is off!";
      }  
    }
  }
  
  if (restart.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    mass = 100;
    ramp_y2 = 250;
    cut_yet = false;
    round = true;
    if (l2) message = "LEVEL 2. Click space to cut rope. A reminder that when" + "\n" + "the ball hits the ramp, the collision is perfectly inelastic";
    else message = "You have been placed on Jupiter to feed a cute alien" + '\n' + "in a rocketship." + "\n" + "Click the space key to cut the rope.";
    g = 25;
    if (l2) setup2();
    else reset_vars();
  }
  if (level2.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    mass = 100;
    ramp_y2 = 250;
    cut_yet = false;
    round = true;
    message = "LEVEL 2. Click space to cut rope. A reminder that when" + "\n" + "the ball hits the ramp, the collision is perfectly inelastic";
    g = 25;
    setup2();
  }
  if (level1.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    mass = 100;
    ramp_y2 = 250;
    cut_yet = false;
    round = true;
    message = "Welcome back to level 1";
    g = 25;
    l2 = false;
    reset_vars();
  }
}
