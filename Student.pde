class Student {
  PVector pos;
  float vel = 1;

  Student() {
    pos = new PVector(0, 0);
  }

  void update(PVector r) {
    r.sub(pos);
    r.mult(-1);

    if (smart) {
      r.normalize();
      r.add(toShore().normalize());
    }

    r.normalize();
    r.mult(dx * vel);
    pos.add(r);
  }

  void show() {
    ellipse(pos.x, pos.y, 3, 3);
  }

  // Calculates the point on the circumference, 
  // that is the closest to the student     
  PVector toShore() {
    PVector v = new PVector(0, 0);
    v.sub(pos);
    v.mult(-1);
    v.normalize();
    v.mult(radius);
    return v;
  }
}
