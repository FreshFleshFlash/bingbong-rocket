class Rocket {
  
  float ratio;
 
  float x = home.houseX;
  float y = home.houseY;
  float w; 
  float h; 
  
  float speed = 3;
  
  float flameX = -150;
  
  Rocket() {}
  
  void display() {

    image(rocketImg, x, y, w, h);
   
    w = rocketImg.width * ratio;
    h = rocketImg.height * ratio;

    ratio = map(y, home.houseY, height, 0.1, 1);
    if(ratio >= 1) ratio = 1;
 
    keyControl();
  }
  
  void keyControl() {
    if(keyPressed) {
      if(keyCode == 39) {
        x += speed;
      } else if(keyCode == 38) {
        y -= speed;
      } else if(keyCode == 40) {
        y += speed;
      } else if(keyCode == 37) {
        x -= speed;
      }
    }
  }
  
  void disappear() {
    w = 0; 
    h = 0;
  }
}