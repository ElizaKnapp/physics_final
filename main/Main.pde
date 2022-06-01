/*
BUGS!!!!!!
The button clicking sensor senses the wrong location?
*/


PImage o_open, o_closed, o_sad, candy_pic, rocket, jupiter;
PImage[] o_eating = new PImage[16];
Pendulum p;
OmNom o;
int rounds = 0; // this is the amount of rounds that have passed to calculuate when omnom's mouth is open
boolean cut_yet = false;
Button len, restart, gravity, level2;
int rope_length = 200;
boolean round = true;
boolean won;
String message = "You have been placed on Jupiter to feed a cute alien" + '\n' + "in a rocketship. Click the space key to cut the rope.";
int g = 25;
int space = 0; // the amount of time it is in space
boolean l2 = false;

public void settings() {
  size(600, 600);
}

void setup() {
  // frameRate(10);
  background(#B79D85);
  loadImages();
  p = new Pendulum(200, 200, rope_length, 90, candy_pic, g);
  o = new OmNom(o_open, o_closed, o_sad, o_eating);
  len = new Button(100, 500, color(255,0,0), 25, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 25, "Restart"); 
  gravity = new Button(150, 500, color(100, 100, 0), 25, "Gravity");
  level2 = new Button(550, 50, color(0, 100, 100), 35, "Level 2");
  won = false;
}

void reset_vars() {
  background(#B79D85);
  p = new Pendulum(200, 200, rope_length, 90, candy_pic, g);
  o = new OmNom(o_open, o_closed, o_sad, o_eating);
  len = new Button(100, 500, color(255,0,0), 25, "Length"); 
  restart = new Button(50, 500, color(0,0,255), 25, "Restart"); 
  gravity = new Button(150, 500, color(100, 100, 0), 25, "Gravity");
  level2 = new Button(550, 50, color(0, 100, 100), 35, "Level 2");
  won = false;
}

void setup2() {
  background(0);
  fill(255);
  text("fdaijflajsflsdf", 200, 200);
  l2 = true;
}

void draw() {
  if (l2) {
    background(0);
  }
  else if (space > 0) {
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
  
  // display whatever the message is
  textSize(20);
  textAlign(LEFT);
  if (message.equals("input: lengths 50-300")) fill(color(0,255,0));
  else if (message.contains("Jupiter") || message.contains("rocket") || message.contains("pendulum") || message.contains("Good work!")) fill(color(0,255,0));
  else fill(color(255,0,0));
  text(message, 20, 100);
  textSize(12);
   
  // display the buttons
  len.display();
  restart.display();
  gravity.display();
  if (!round && won) {
    level2.display();
    message = "Good work! Click the button on the top right to" + "\n" + "proceed to the next level";
  }
  
  // omnom's picture
  o.check_eating_state(p.c);
  if (o.eating) won = true;
  o.display();
  
  
  // move and then display the pendulum
  p.move();
  p.display();
  
  if (p.c.xPos > 600) round = false;
  
  if (rounds % 2 == 0) {
    o.next_img();
  }
  
  /*
  if (rounds % 20 == 0) {
    o.change();
  }
  */
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
            if (new_length <= 300 && new_length >= 50) {
              rope_length = new_length;
              message = "Notice how the period of the pendulum changes" + "\n" + "with the different length" + '\n' + "Click the space key to cut the rope.";
             } else message = "please input a length from 50 to 300";
            rounds = 0;
            reset_vars();
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
          message = "You have traveled through space, notice how the period" + "\n" + "of the pendulum changes." + "\n" + "Click the space key to cut the rope.";
         } else message = "please input a gravity value from 1 to 25";
        rounds = 0;
        reset_vars();
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
      if (!len.clicked) {
        len.clicked = true;
        len.change_color(100);
        message = "input: lengths 50-300";
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
      if (!gravity.clicked) {
        gravity.clicked = true;
        gravity.change_color(100);
        message = "Drive the rocket away from jupiter to adjust gravity" + '\n' + "Input values 0-25 m/s^2 for acc due to gravity";
      } else {
        gravity.clicked = false;
        gravity.change_color(gravity.og_c);
        gravity.i.text = "";
        message = "";
      }
    }
  }
  if (restart.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    cut_yet = false;
    round = true;
    message = "You have been placed on Jupiter to feed a cute alien" + '\n' + "in a rocketship." + "\n" + "Click the space key to cut the rope.";
    g = 25;
    reset_vars();
  }
  if (level2.on_button(mouseX, mouseY)) {
    rounds = 0;
    rope_length = 200;
    cut_yet = false;
    round = true;
    message = "LEVEL 2";
    g = 25;
    setup2();
  }
}
