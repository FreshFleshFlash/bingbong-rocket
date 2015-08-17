class Rocket {
  
  float ratio;
 
  float x = home.houseX;
  float y = home.houseY;
  float w; 
  float h; 
  
  float speed = 3 * 2.5;
  
  float flameX = -150;
  
  Rocket() {}
  
  void display() {
    //flame();

    image(rocketImg, x, y, w, h);
   
    w = rocketImg.width * ratio * 2;
    h = rocketImg.height * ratio * 2;

    ratio = map(y, home.houseY, height, 0.1, 1);
    if(ratio >= 1) ratio = 1;
 
    keyControl();
    //control();
    
    
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
    y = height - pitch * 20 + malePlayer;
  }
  
  int numOfLines = 20;
  
  void flame() {
   for(int i = 0; i < numOfLines; i++) {
     pushMatrix();
     translate(x - w/2, y + 40);
     rotate(radians(-20));
     stroke(i * (360 / numOfLines), 70, 70);
     line(0, i, flameX, i);
     popMatrix();   
   }
    
  }
  
  void fall() {
//    if(amp <= 0) {
//      fall..
//    }
  }

}