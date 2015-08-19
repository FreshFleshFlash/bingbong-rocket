///////////////////////////////////////////////
int NumOfBars=64;     
import processing.serial.*;
Serial myPort;        
boolean firstContact = false; 
int[] serialInArray = new int[NumOfBars];
int serialCount = 0;

float amp = 0;
float pitch = 0;

int[] bars = new int[NumOfBars];
int LeftMargin=100;
int RightMArgin=80;
int TextGap=50;
int GraphYposition=80; 
float BarPercent = 0.4;
float yRatio = 0.58;
int BarGap, BarWidth, DivisounsWidth;
//////////////////////////////////////////////

int currentMillis;
int readyTimer;
int finishTimer;
               
PImage houseImg, bbImg, joyImg, rocketImg, moonImg, starImg, cloudImg;

boolean start = false;
boolean ready = false;
boolean floatt = false;
boolean go = false;
boolean finish = false;

boolean hasAmp = false;

int numOfStars = 50;
int numOfClouds = 50;

float scrollX;
float scrollY = -1600;
float scrollXSpeed = 0;
float scrollYSpeed = 0;

float bgS = 50;
float bgB = 50;

int score = 0;

float malePlayer;
char player;

Home home;
Rocket rocket; 
Moon moon;
Star[] stars = new Star[numOfStars];
Cloud[] clouds = new Cloud[numOfClouds];
Scoreboard scoreboard;

Process process;
Display display;
Controller controller;

void setup(){
  myPort = new Serial(this, "/dev/tty.usbmodem1411", 57600); 
  DivisounsWidth = (width-LeftMargin-RightMArgin)/(NumOfBars); 
  BarWidth = int(BarPercent*float(DivisounsWidth));
  BarGap = DivisounsWidth - BarWidth;

  houseImg = loadImage("house.png");
  bbImg = loadImage("bingbong.png");
  joyImg = loadImage("joy.png");
  rocketImg = loadImage("bbrocket_fullflame.png");
  moonImg = loadImage("moon.png");
  starImg = loadImage("star.png");
  cloudImg = loadImage("cloud.png");
 
  size(displayWidth, displayHeight, P3D);
  smooth();
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  rectMode(CENTER);

  controller =  new Controller();

  process = new Process();
  
  display = new Display();
  
  home = new Home();
  
  rocket = new Rocket();
  
  moon = new Moon();
  
  for(int i = 0; i < numOfStars; i++) {
    stars[i] = new Star(random(width*0.8, width * 3), random(height));
  }  
  
  for(int i = 0; i < numOfClouds; i++) {
    clouds[i] = new Cloud(random(width*0.8, width * 3), random(height));
  }
  
  scoreboard = new Scoreboard();
}

void draw(){
  println(pitch);
  
  currentMillis = millis();
  background(221, bgS, bgB);  
  //PrintBars();
        
  translate(scrollX, scrollY);
  scrollX -= scrollXSpeed;
  scrollY += scrollYSpeed;
  
  process.begin();
    
  bgS = map(scrollY, -1600, 0, 50, 50);
  bgB = map(scrollY, -1600, 0, 100, 50);
}

void serialEvent(Serial myPort) {
 int inByte = myPort.read();
  
 if (firstContact == false) {
   if (inByte == 'A') { 
     myPort.clear();          
     firstContact = true;     
     myPort.write('A');       
   } 
 } else {
   serialInArray[serialCount] = inByte;
   serialCount++;

   if (serialCount > NumOfBars - 1 ) {
     for (int x = 0; x < NumOfBars; x++) { 
       bars[x] = int (yRatio * height * (serialInArray[x] / 256.0));
        
       if(amp < bars[x]) {
         amp = bars[x];
         pitch = x;
       }
     }
     
     if(pitch > 10) {
       hasAmp= true;
     }
     
     amp = 0;

     myPort.write('A');
     serialCount = 0;
   }
 }
}

//void PrintBars(){ 
//  int c = 0;
//  for (int i = 0; i < NumOfBars; i++) {
//    fill((0xe4 + c), (255 - bars[i] + c), (0x1a + c));
//    stroke(90);
//    rect(i * DivisounsWidth + LeftMargin, height - GraphYposition, BarWidth, -bars[i]);
//    fill(0x2e, 0x2a, 0x2a);
//    text(bars[i], i*DivisounsWidth + LeftMargin + BarWidth/2,   height - bars[i] - 5 - GraphYposition);
//    text(i, i*DivisounsWidth + LeftMargin + BarWidth/2 + 5, height - GraphYposition + 20 );
//  }
//}