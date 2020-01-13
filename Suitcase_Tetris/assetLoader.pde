// Loads all of the sounds and images

PFont font;
PImage Pointer;
PImage commaSprite0, ISprite0, JSprite0, LSprite0, OSprite0, pointSprite0, SSprite0, ZSprite0, TSprite0; 
PImage commaSprite1, ISprite1, JSprite1, LSprite1, SSprite1, ZSprite1, TSprite1; 
PImage commaSprite2, ISprite2, JSprite2, LSprite2, TSprite2; 
PImage commaSprite3, ISprite3, JSprite3, LSprite3, TSprite3; 
PImage spriteN[] = new PImage[72];
PImage kerst;
SoundFile beep, bgmusic, gameover;

PImage Level, logo, gameE, gameB, gameI, gameT;

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


<<<<<<< HEAD

=======
  Pointer = loadImage("./sprites/thatpointyboy.png");
>>>>>>> master
  Level = loadImage("./sprites/TemporaryDifficultySelectForTesting.png" ); // as the name suggests, its temporary to test if the homescreen works - kiano :)
  logo = loadImage("./sprites/logo img.png");
  gameE = loadImage("./sprites/Gamebg-easy.png");
  gameB = loadImage("./sprites/Gamebg-balanced.png");
  gameI = loadImage("./sprites/Gamebg-insane.png");
  gameT = loadImage("./sprites/Gamebg-tutorial.png");

  // images

  spriteN[0]  = loadImage("./sprites/easy sprites/comma-0.png");
  spriteN[1] = loadImage ("./sprites/easy sprites/I-0.png");
  spriteN[2] = loadImage ("./sprites/easy sprites/J-0.png");
  spriteN[3] = loadImage ("./sprites/easy sprites/L-0.png");
  spriteN[4] = loadImage("./sprites/easy sprites/O.png");
  spriteN[5] = loadImage("./sprites/easy sprites/point.png");
  spriteN[6] = loadImage("./sprites/easy sprites/S-0.png");
  spriteN[7] = loadImage("./sprites/easy sprites/Z-0.png");
  spriteN[8] = loadImage("./sprites/easy sprites/T-0.png");
  spriteN[9] = loadImage("./sprites/easy sprites/comma-1.png");
  spriteN[10] = loadImage ("./sprites/easy sprites/I-1.png");
  spriteN[11] = loadImage ("./sprites/easy sprites/J-1.png");
  spriteN[12] = loadImage ("./sprites/easy sprites/L-1.png");
  spriteN[13] = loadImage("./sprites/easy sprites/S-1.png");
  spriteN[14] = loadImage("./sprites/easy sprites/Z-1.png");
  spriteN[15] = loadImage("./sprites/easy sprites/T-1.png");
  spriteN[16] = loadImage("./sprites/easy sprites/comma-2.png");
  spriteN[17] = loadImage ("./sprites/easy sprites/J-2.png");
  spriteN[18] = loadImage ("./sprites/easy sprites/L-2.png");
  spriteN[19] = loadImage("./sprites/easy sprites/T-2.png");
  spriteN[20] = loadImage("./sprites/easy sprites/comma-3.png");
  spriteN[21] = loadImage ("./sprites/easy sprites/J-3.png");
  spriteN[22] = loadImage ("./sprites/easy sprites/L-3.png");
  spriteN[23] = loadImage("./sprites/easy sprites/T-3.png");
  spriteN[24]  = loadImage("./sprites/balanced sprites/comma-0.png");
  spriteN[25] = loadImage ("./sprites/balanced sprites/I-0.png");
  spriteN[26] = loadImage ("./sprites/balanced sprites/J-0.png");
  spriteN[27] = loadImage ("./sprites/balanced sprites/L-0.png");
  spriteN[28] = loadImage("./sprites/balanced sprites/O.png");
  spriteN[29] = loadImage("./sprites/balanced sprites/point.png");
  spriteN[30] = loadImage("./sprites/balanced sprites/S-0.png");
  spriteN[31] = loadImage("./sprites/balanced sprites/Z-0.png");
  spriteN[32] = loadImage("./sprites/balanced sprites/T-0.png");
  spriteN[33] = loadImage("./sprites/balanced sprites/comma-1.png");
  spriteN[34] = loadImage ("./sprites/balanced sprites/I-1.png");
  spriteN[35] = loadImage ("./sprites/balanced sprites/J-1.png");
  spriteN[36] = loadImage ("./sprites/balanced sprites/L-1.png");
  spriteN[37] = loadImage("./sprites/balanced sprites/S-1.png");
  spriteN[38] = loadImage("./sprites/balanced sprites/Z-1.png");
  spriteN[39] = loadImage("./sprites/balanced sprites/T-1.png");
  spriteN[40] = loadImage("./sprites/balanced sprites/comma-2.png");
  spriteN[41] = loadImage ("./sprites/balanced sprites/J-2.png");
  spriteN[42] = loadImage ("./sprites/balanced sprites/L-2.png");
  spriteN[43] = loadImage("./sprites/balanced sprites/T-2.png");
  spriteN[44] = loadImage("./sprites/balanced sprites/comma-3.png");
  spriteN[45] = loadImage ("./sprites/balanced sprites/J-3.png");
  spriteN[46] = loadImage ("./sprites/balanced sprites/L-3.png");
  spriteN[47] = loadImage("./sprites/balanced sprites/T-3.png");
  spriteN[48]  = loadImage("./sprites/insane sprites/comma-0.png");
  spriteN[49] = loadImage ("./sprites/insane sprites/I-0.png");
  spriteN[50] = loadImage ("./sprites/insane sprites/J-0.png");
  spriteN[51] = loadImage ("./sprites/insane sprites/L-0.png");
  spriteN[52] = loadImage("./sprites/insane sprites/O.png");
  spriteN[53] = loadImage("./sprites/insane sprites/point.png");
  spriteN[54] = loadImage("./sprites/insane sprites/S-0.png");
  spriteN[55] = loadImage("./sprites/insane sprites/Z-0.png");
  spriteN[56] = loadImage("./sprites/insane sprites/T-0.png");
  spriteN[57] = loadImage("./sprites/insane sprites/comma-1.png");
  spriteN[58] = loadImage ("./sprites/insane sprites/I-1.png");
  spriteN[59] = loadImage ("./sprites/insane sprites/J-1.png");
  spriteN[60] = loadImage ("./sprites/insane sprites/L-1.png");
  spriteN[61] = loadImage("./sprites/insane sprites/S-1.png");
  spriteN[62] = loadImage("./sprites/insane sprites/Z-1.png");
  spriteN[63] = loadImage("./sprites/insane sprites/T-1.png");
  spriteN[64] = loadImage("./sprites/insane sprites/comma-2.png");
  spriteN[65] = loadImage ("./sprites/insane sprites/J-2.png");
  spriteN[66] = loadImage ("./sprites/insane sprites/L-2.png");
  spriteN[67] = loadImage("./sprites/insane sprites/T-2.png");
  spriteN[68] = loadImage("./sprites/insane sprites/comma-3.png");
  spriteN[69] = loadImage ("./sprites/insane sprites/J-3.png");
  spriteN[70] = loadImage ("./sprites/insane sprites/L-3.png");
  spriteN[71] = loadImage("./sprites/insane sprites/T-3.png");

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

<<<<<<< HEAD

  // images

  
 
  

=======
>>>>>>> master

  // images
}
