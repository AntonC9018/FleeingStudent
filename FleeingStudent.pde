float dx = 0.01;
float radius = 150;
float start = 3.5;

int steps;
int fc;

Student st;
Prof pr;

String end = "";
boolean drawn;

// See Student's update()
boolean smart = true;

void setup() {
  frameRate(60);
  size(500, 500);
  preset();
  strokeWeight(0.5);
}

void preset() {
  st = new Student();
  pr = new Prof(random(0, TAU), start);

  end = "";
  drawn = false;
  fc = frameCount;
  steps = 0;
}

void draw() {
  translate(width/2, height/2);

  if (!end.equals("")) {
    if (!drawn) {
      //drawStats();
      textSize(30);
      textAlign(CENTER, CENTER);
      fill(0);
      text(end, 0, 0);

      drawn = true;
    }
    if (frameCount - fc > 40) 
      preset();

    return;
  }

  background(255);
  fill(130, 220, 250);
  ellipse(0, 0, radius * 2, radius * 2);
  drawStats(); 
  
  for (int i = 0; i < 200; i++) {
    steps++;
    st.update(pr.pos.copy());

    st.toShore();
    pr.update(st);

    if (abs(st.pos.y - pr.pos.y) < 0.5 && abs(st.pos.x - pr.pos.x) < 0.5 || frameCount - fc > 120) {
      end= "Professor wins";
      fc = frameCount;
      break;
    }

    if (st.pos.mag() > radius) {
      end = "Student wins";
      fc = frameCount;
      break;
    }
  }
  st.show();
  pr.show();
}

void drawStats() {
  pushMatrix();
  translate(-width/2, -height/2);
  textAlign(LEFT, TOP);
  textSize(10);
  fill(0);
  text("Relative velocity:" + pr.vel, 0, 0);
  String s = (smart) ? "Smart": "Fleeing";
  text("Mode: " + s, 0, 10);
  text("Steps taken: " + steps, 0, 20);
  popMatrix();
}
