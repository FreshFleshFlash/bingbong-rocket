class Star {
  
  float x, y;
  float w = 30;
  float h = 30;
  boolean met = false;
  
  float twinkleAng;
  
  Star() {}
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {   
    float angle = TWO_PI / 5;
    float halfAngle = angle/2.0;
    pushMatrix();
    translate(x, y);
    rotate(radians(twinkleAng));
    pushStyle();
    noStroke();
    fill(47, 39, 78);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = 0 + cos(a) * w;
      float sy = 0 + sin(a) * h;
      vertex(sx, sy);
      sx = 0 + cos(a+halfAngle) * w/2;
      sy = 0 + sin(a+halfAngle) * h/2;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popStyle();
    popMatrix();
    
    plus();
    twinkle();
  }
   
  void plus() {
    if(meet()) {
      met = true;
      score += 10;
    }
  }

  void twinkle() {
    if(met == true) {
      twinkleAng += 5;
    }
  }  
  
  boolean meet() {
    if(met == false && rocket.x >= x - rocket.w/2 && rocket.x <= x + rocket.w/2 && rocket.y >= y - rocket.h/2 && rocket.y <= y + rocket.h/2) {
      return true;
    } 
    return false;
  }
}