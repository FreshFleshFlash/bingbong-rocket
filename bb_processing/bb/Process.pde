class Process {
  
  int whenToStart = 1000;

  Process() {}
  
  void begin() {
  
    if(!ready && !start) {
      home.ask();
      
      if(keyPressed) {  // if(amp > ~~) {
        if(key == 'b' || key == 'B') {  // if(pitch <= ~~) {       //which pitch? 
          player = 'b';
          //malePlayer = ;  // advantage
        } else if(key == 'j' || key == 'J') {  // if(pitch >= ~~) {
          player = 'j';
        }
        
        readyMillis = millis();
        
        ready = true;
      }
    }
    
    if(ready && !start) {   
      home.answer();
      
      if(currentMillis >= readyMillis + whenToStart) {
        ready = false;
        start = true;
      }
    }
    
    
    if(start) {
      display.orderly();
      
      if(rocket.y <= home.y) floatt = true;
      
      if(floatt) {
        scrollY = -rocket.y + 400;
        
        if(scrollY >= 0) go = true;
        
        if(go) {
          scrollXSpeed = 3;
          scrollYSpeed = 0;
          scrollY = 0;
          
          if(-scrollX + width / 2 > moon.x) finish = true;
  
          if(finish) {
            scrollXSpeed = 0;  
          }
        }
      }
    }  
  }
}