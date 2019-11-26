// Loads all of the sounds and images

SoundFile beep, bgmusic;
<<<<<<< Updated upstream
PImage Level, logo;
=======
PImage commaSprite, ISprite, JSprite, LSprite, OSprite, pointSprite, SSprite, ZSprite, TSprite; 
>>>>>>> Stashed changes

public void loadAssets () {
  // sounds
  beep = new SoundFile(this, "./sounds/beep.wav");
  bgmusic = new SoundFile(this, "./sounds/bgmusic.wav"); // t is nog niet hoe ik het wil dus er komt nog verandering in
  bgmusic.loop();
<<<<<<< Updated upstream
  Level = loadImage("./sprites/TemporaryDifficultySelectForTesting.png" ); // as the name suggests, its temporary to test if the homescreen works - kiano :)
  logo = loadImage("./sprites/logo img.png");
=======
  
  // images
  commaSprite = loadImage("comma.png");
  ISprite = loadImage ("I.png");
  JSprite = loadImage ("J.png");
  LSprite = loadImage ("L.png");
  
>>>>>>> Stashed changes
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
}
