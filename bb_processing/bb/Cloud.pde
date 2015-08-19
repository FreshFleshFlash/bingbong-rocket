class Cloud {

  float x, y;
  float w = cloudImg.width * 0.5;
  float h = cloudImg.height * 0.5;
  boolean met = false;
  color cloudTint = color(0, 0, 99);  
  
  float border = 20;
  
  float rainX;
  float rainY;
  float rainSpeed = 1;
  float rainLeng = 5;

  Cloud(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    pushStyle();
    tint(cloudTint);
    image(cloudImg, x, y, w, h);
    popStyle();
    
    minus();
    rain();
  }
  
  void minus() {
    if(meet()) {
      cloudTint = color(0, 0, 45);
      rain();
      met = true;
      score -= 1;
    }
  }
  
  void rain() {
    if(met == true) {
      strokeWeight(2);
      stroke(0, 0, 45);
      pushMatrix();
      translate(x, y + h/2);
      for(int i = -5; i < 5; i++) {
        for(int j = 0; j < 3; j++) {
          pushMatrix();
          translate(5, 0);
          line(rainX + i * 10, rainY + j * 15, rainX + i * 10, rainY + j * 15 + rainLeng);
          popMatrix();
        }
      }
      popMatrix();
  
      rainY += rainSpeed;
      
      if(rainY > 60) rainY = 0; 
    }
  }

  boolean meet() {
    if (met == false && rocket.x + rocket.w/2 >= x - w/2 - border && rocket.x + rocket.w/2 <= x + w/2 + border && rocket.y - rocket.h/2 >= y - h/2 - border && rocket.y - rocket.h/2 <= y + h/2 + border) {
      return true;
    }
    return false;
  }  
}