SoundFile beep, bgmusic;
PImage Level, logo;

public void loadAssets () {
  beep = new SoundFile(this, "./sounds/beep.wav");
  bgmusic = new SoundFile(this, "./sounds/bgmusic.wav"); // t is nog niet hoe ik het wil dus er komt nog verandering in
  bgmusic.loop();
  Level = loadImage("./sprites/TemporaryDifficultySelectForTesting.png" ); // as the name suggests, its temporary to test if the homescreen works - kiano :)
  logo = loadImage("./sprites/logo img.png");
}
