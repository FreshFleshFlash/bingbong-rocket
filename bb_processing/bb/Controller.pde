class Controller {

  Controller() {}
  
  void brrr() {
    if(!go) {
      if(pitch > 9) {
        rocket.y -= 5;
      } else {
        rocket.y++;
      }
    }
  }
  
  void drive() {
    if(!finish) {
      rocket.x += rocket.speed; 
      rocket.y = height - (pitch - 10) * 160 + malePlayer;
      
      if(pitch > 5 || keyPressed) {
        scrollXSpeed = 3;
        rocket.speed = 3;
      } 
      else {
       scrollXSpeed = 0;
       rocket.speed = 0;
          
       pushStyle();
       textSize(200);
       text("SING!", rocket.x, height/2);
       popStyle();
      }    
    }
  }
}