class Moon {

  float x = width * 4;
  float y = height / 2;
  float w = moonImg.width * 0.5 * 0.9;
  float h = moonImg.height * 0.5 * 0.9;
  
  Star s = new Star();
  
  Moon() {}
  
  void display() {
    image(moonImg, x, y, w, h);
    
    //finish();
  }
  
  void finish() { 
//    if(-scrollX + width / 2 > x) {
//      scrollXSpeed = 0;
//      
//      for(int i = score; i >= 0; i -= 10) {
//        image(starImg, x - w/2 + i * 2, y, s.w, s.h);
//      }   
//    }  
  }
}
