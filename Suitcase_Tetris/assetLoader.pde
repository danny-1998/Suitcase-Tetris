// Loads all of the sounds and images

PFont font;
PImage commaSprite0, ISprite0, JSprite0, LSprite0, OSprite0, pointSprite0, SSprite0, ZSprite0, TSprite0; 
PImage commaSprite1, ISprite1, JSprite1, LSprite1, SSprite1, ZSprite1, TSprite1; 
PImage commaSprite2, ISprite2, JSprite2, LSprite2, TSprite2; 
PImage commaSprite3, ISprite3, JSprite3, LSprite3, TSprite3; 
PImage spriteN[] = new PImage[24];
PImage kerst;
SoundFile beep, bgmusic, gameover;

PImage Level, logo, game;

PImage commaSprite, ISprite, JSprite, LSprite, OSprite, pointSprite, SSprite, ZSprite, TSprite; 



public void loadAssets () {
  
  //font
  font = createFont("./data/font.ttf", 100);
  
    textFont(font);
  // sounds
  beep = new SoundFile(this, "./sounds/beep.wav");
  bgmusic = new SoundFile(this, "./sounds/suitcase_bop.wav");
  bgmusic.loop();


  gameover = new SoundFile(this, "./sounds/gameover.wav");

 


  Level = loadImage("./sprites/TemporaryDifficultySelectForTesting.png" ); // as the name suggests, its temporary to test if the homescreen works - kiano :)
  logo = loadImage("./sprites/logo img.png");
  game = loadImage("./sprites/Gamebg.png");


  // images

  commaSprite0 = loadImage("./sprites/comma-0.png");
  ISprite0 = loadImage ("./sprites/I-0.png");
  JSprite0 = loadImage ("./sprites/J-0.png");
  LSprite0 = loadImage ("./sprites/L-0.png");
  OSprite0 = loadImage("./sprites/O.png");
  pointSprite0 = loadImage("./sprites/point.png");
  SSprite0 = loadImage("./sprites/S-0.png");
  ZSprite0 = loadImage("./sprites/Z-0.png");
  TSprite0 = loadImage("./sprites/T-0.png");
  commaSprite1 = loadImage("./sprites/comma-1.png");
  ISprite1 = loadImage ("./sprites/I-1.png");
  JSprite1 = loadImage ("./sprites/J-1.png");
  LSprite1 = loadImage ("./sprites/L-1.png");
  SSprite1 = loadImage("./sprites/S-1.png");
  ZSprite1 = loadImage("./sprites/Z-1.png");
  TSprite1 = loadImage("./sprites/T-1.png");
  commaSprite2 = loadImage("./sprites/comma-2.png");
  JSprite2 = loadImage ("./sprites/J-2.png");
  LSprite2 = loadImage ("./sprites/L-2.png");
  TSprite2 = loadImage("./sprites/T-2.png");
  commaSprite3 = loadImage("./sprites/comma-3.png");
  JSprite3 = loadImage ("./sprites/J-3.png");
  LSprite3 = loadImage ("./sprites/L-3.png");
  TSprite3 = loadImage("./sprites/T-3.png");

  spriteN[0]  = loadImage("./sprites/comma-0.png");
  spriteN[1] = loadImage ("./sprites/I-0.png");
  spriteN[2] = loadImage ("./sprites/J-0.png");
  spriteN[3] = loadImage ("./sprites/L-0.png");
  spriteN[4] = loadImage("./sprites/O.png");
  spriteN[5] = loadImage("./sprites/point.png");
  spriteN[6] = loadImage("./sprites/S-0.png");
  spriteN[7] = loadImage("./sprites/Z-0.png");
  spriteN[8] = loadImage("./sprites/T-0.png");
  spriteN[9] = loadImage("./sprites/comma-1.png");
  spriteN[10] = loadImage ("./sprites/I-1.png");
  spriteN[11] = loadImage ("./sprites/J-1.png");
  spriteN[12] = loadImage ("./sprites/L-1.png");
  spriteN[13] = loadImage("./sprites/S-1.png");
  spriteN[14] = loadImage("./sprites/Z-1.png");
  spriteN[15] = loadImage("./sprites/T-1.png");
  spriteN[16] = loadImage("./sprites/comma-2.png");
  spriteN[17] = loadImage ("./sprites/J-2.png");
  spriteN[18] = loadImage ("./sprites/L-2.png");
  spriteN[19] = loadImage("./sprites/T-2.png");
  spriteN[20] = loadImage("./sprites/comma-3.png");
  spriteN[21] = loadImage ("./sprites/J-3.png");
  spriteN[22] = loadImage ("./sprites/L-3.png");
  spriteN[23] = loadImage("./sprites/T-3.png");
  
  kerst = loadImage("./sprites/kerstmuts.png");
   kerst.resize(240, 220);

}

// Spritesheet class to draw sprite animations
class SpriteSheet {

  // The image containing the frames and the image to draw
  PImage sourceImage, drawImage;
  int fps = 6;
  int frame = 0;
  int frameWidth;
  int frameHeight;
  int nFrames = 17;
  //int x, y;

  // Contructor takes name of source image and the amount of frames 
  SpriteSheet(String imageName, int nFrames) {
    nFrames = 17;
    sourceImage = loadImage("./sprites/suitcase tetris logo.png");
    this.nFrames = nFrames;
    frameWidth = sourceImage.width/nFrames;
    frameHeight = sourceImage.height;
    drawImage = createImage(frameWidth, sourceImage.height, ARGB);
  }

  // update() selects the image to draw based on fps and frames already drawn
  void update() {
    if ((frameCount % fps) == 0)    
      frame =  (frame + 1) % nFrames;

    drawImage.copy(sourceImage, 
      frame*frameWidth, 0, frameWidth, sourceImage.height, 
      0, 0, frameWidth, sourceImage.height);
  }

  // draw the target image
  void draw(float x, float y) {
    image(drawImage, x, y);
  }


  // images

  
 
  


}
