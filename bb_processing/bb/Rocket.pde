class Rocket {
  
  float ratio;
 
  float x = home.houseX;
  float y = home.houseY;
  float w; 
  float h; 
  
  float speed = 3 * 2.5;
  
  float flameX = -150;
  
  float b = 100;
  
  
  Rocket() {}
  
  void display() {
    
    pushStyle();
    tint(0, 0, b);
    image(rocketImg, x, y, w, h);
    popStyle();
    //ratio = 1;
    w = rocketImg.width * ratio;
    h = rocketImg.height * ratio;
    
    ratio = map(y, home.houseY, height/2, 0.1, 1);

    keyControl();
    //control();
    //flame();
    
    if(x + scrollX < 0) {
      //game over
    }

  }
  
  void keyControl() {
    if(keyPressed) {
      if(keyCode == 39) {
        x += speed;
      } else if(keyCode == 38) {
        y -= speed;
      } else if(keyCode == 40) {
        y += speed;
      }
    }
  }
  
  void control() {
    x += speed; 
    y = height - pitch * 20;
  }
  
  int numOfLines = 20;
  
  void flame() {
//    for(int i = 0; i < numOfLines; i++) {
//      pushMatrix();
//      translate(x, y);
//      rotate(radians(-30));
//      stroke(i * (360 / numOfLines), 70, 70);
//      line(0, i+100, flameX, i+100);
//      popMatrix();
//      flameX += 2;
//      if(flameX > 30) {
//        flameX = -150;
//      }
//    }
    
  }
  
  void fall() {
//    if(b <= 0) {
//      speed = 0;
//    }
  }

}
