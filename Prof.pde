class Prof {

  PVector pos;
  float vel;
  
  Prof(float x, float v) {
    pos = new PVector(cos(x) * radius, sin(x) * radius);
    vel = v;
  }

  void update(Student st) {
    PVector v = st.toShore();    

    float dth = vel * dx / radius;
    
    // the idea is to try to add the contributions of the 
    // two possible movement vectors one by one on the side 
    // and pick the one that gets you closer to the student
    float c1 = calc(dth, pos, v);
    float c2 = calc(-dth, pos, v);
    
    pos = (pos.rotate((c1 > c2) ? -dth: dth));
  }

  void show() {
    ellipse(pos.x, pos.y, 4, 4);
  }

  float calc(float dth, PVector pos, PVector st) {    
    PVector p = pos.copy();
    p.rotate(dth);
    p.sub(st);
    return p.mag();
  }
}
