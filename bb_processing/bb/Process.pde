class Process {
  
  int whenToStart = 1000;
  int whenToFinish = 1500;
  int baseline = 14;

  Process() {}
  
  void begin() {
  
    if(!ready && !start) {
      home.ask();
      
      if(keyPressed || hasAmp) {  
        if(key == 'b' || key == 'B' || pitch < baseline) {  
          player = 'b';
          //malePlayer = ;  // advantage
        } else if(key == 'j' || key == 'J' || pitch >= baseline) {  
          player = 'j';
        }
        
        readyTimer = millis();
        
        ready = true;
      }
    }
    
    if(ready && !start) {   
      home.answer();
      
      if(currentMillis >= readyTimer + whenToStart) {
        ready = false;
        start = true;
      }
    }
    
    
    if(start) {
      display.orderly();
      controller.brrr();
      
      if(rocket.y <= home.y) floatt = true;
      
      if(floatt) {       
        scrollY = -rocket.y + 400;
 
        if(scrollY >= 0) go = true;
        
        if(go) {
          controller.drive();
          
          scrollYSpeed = 0;
          scrollY = 0;
          
          if(-scrollX + width / 2 > moon.x) {
            scrollXSpeed = 0;
            if(rocket.x + rocket.w/2 > moon.x) {
              rocket.speed = 0;
              rocket.y = height/2;
              rocket.disappear();
              
              finish = true;
              moon.showScore();
            }          
          }
        }
      }
    }  
  }
}