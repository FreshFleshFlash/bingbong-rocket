class Scoreboard {

  float x = 1150;
  float y = 80;
  
  void display() {
    pushStyle();
    textSize(32);
    text(score, x, y);
    popStyle();
    
    x += scrollXSpeed;
  }
}