class Moon {

  float x = width * 4;
  float y = height / 2;
  float w = moonImg.width * 0.5 * 0.9;
  float h = moonImg.height * 0.5 * 0.9;
  
  Star s = new Star();
  
  Moon() {}
  
  void display() {
    image(moonImg, x, y, w, h);
  }
  
  void showScore() { 
     pushStyle();
     textSize(50);
     text("You made it!!!", moon.x - moon.w/2, moon.y);
     popStyle();
  }
}