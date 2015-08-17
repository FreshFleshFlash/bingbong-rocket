class Star {
  
  float x, y;
  float w = starImg.width * 0.5; 
  float h = starImg.height * 0.5;
  boolean met = false;
  
  float ang;
  
  Star() {}
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {   
    pushMatrix(); 
    translate(x, y);
    rotateY(radians(ang));
    pushStyle();
    //tint(47, 39, 78);
    image(starImg, 0, 0, w, h);
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
      ang += 5;
    }
  }  
  
  boolean meet() {
    if(met == false && rocket.x > x && rocket.x < x + w && rocket.y > y && rocket.y < y + h) {
      return true;
    } 
    return false;
  }
}
