class Display {

  Display() {}
  
  void orderly() {   
    for(int i = 0; i < numOfClouds; i++) {
      clouds[i].display();
    }
    
    for(int i = 0; i < numOfStars; i++) {
      stars[i].display();
    }

    scoreboard.display();
   
    rocket.display();
    
    home.display();
    
    moon.display();
  }
}
