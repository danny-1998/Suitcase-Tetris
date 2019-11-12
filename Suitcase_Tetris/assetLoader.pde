SoundFile beep, bgmusic;

public void loadAssets () {
  beep = new SoundFile(this, "./sounds/beep.wav");
  bgmusic = new SoundFile(this, "./sounds/bgmusic.wav"); // t is nog niet hoe ik het wil dus er komt nog verandering in
  bgmusic.loop();
}
