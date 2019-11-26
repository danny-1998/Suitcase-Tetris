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
