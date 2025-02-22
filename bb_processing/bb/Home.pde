class Home {
  
  float x = width/ 2;
  float y = -scrollY + height/2;  
  
  float gap = 100;
  
  float bbW = bbImg.width * 0.25;
  float bbH = bbImg.height * 0.25;
  float bbX = x - bbW/2 - gap;
  float bbY = y;

  float joyW = joyImg.width * 0.52;
  float joyH = joyImg.height * 0.52;
  float joyX = x + joyW/2 + gap;
  float joyY = y + 15;
  
  float houseW = houseImg.width * 0.5;
  float houseH = houseImg.height * 0.5;
  float houseX = x - 300;
  float houseY = y + height/2 - houseH/2;
  
  Home() {}
  
  void ask() {
    image(bbImg, bbX, bbY, bbW, bbH);
    image(joyImg, joyX, joyY, joyW, joyH);
    textSize(32);
    text("Who's driving?", bbX - bbW/2, y - 230);
    text("OR", x, y);
  }
  
  void answer() {
    if(player == 'b') {
      image(bbImg, bbX, bbY, bbW, bbH);
      text("BingBong's Driving!", joyX, joyY);
    } else if(player == 'j') {
      image(joyImg, joyX, joyY, joyW, joyH);
      text("Joy's Driving!", bbX, bbY);
    }
  }

  void display() {
    image(houseImg, houseX, houseY, houseW, houseH);
  }
}