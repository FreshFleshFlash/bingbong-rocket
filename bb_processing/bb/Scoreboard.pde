class Scoreboard {

  float x = 1170;
  float y = 80;//-scrollY + 80;
  
  void display() {
    textSize(32);
    text(score, x, y);
    x += scrollXSpeed;
    //y -= scrollYSpeed;
  }
}
