class Process {

  Process() {}
  
  void begin() {
  
  if(!start) {
    home.ask();
    
    if(keyPressed) start = true;
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
