class Cloud {

  float x, y;
  float w = cloudImg.width * 0.5;
  float h = cloudImg.height * 0.5;
  boolean met = false;
  color cloudTint = color(0, 0, 99);  //99
  
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
      rocket.b -= 10;
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
      translate(x - w/2, y + h/2);
      for(int i = 0; i < 10; i++) {
        for(int j = 0; j < 3; j++) {
          line(rainX + i * 10, rainY + j * 15, rainX + i * 10, rainY + j * 15 + rainLeng);
        }
      }
      popMatrix();
  
      rainY += rainSpeed;
      
      if(rainY > 60) rainY = 0; 
    }
  }

  boolean meet() {
    if (met == false && rocket.x > x && rocket.x < x + w && rocket.y > y && rocket.y < y + h) {
      return true;
    }
    return false;
  }  
}
