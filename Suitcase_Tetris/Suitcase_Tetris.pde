import processing.sound.*;
PImage img1, img2;

Grid grid;
SpriteSheet spriteSheet;
TBlock tBlock;
Location blockPlace;
PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;
HomeScreen home;
ZBlock zBlock;
JBlock jBlock;
Lblock lBlock;
IBlock iBlock;


PointBlock pointblock;
OBlock oblock;
CommaBlock commaBlock;

Control control;
CurrentBlock currentBlock, nextPiece;
Score score;
boolean gameOn;
int dt, currentTime;
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  home = new HomeScreen();
  loadAssets ();
  spriteSheet = new SpriteSheet("suitcase tetris logo.png", 17);
  tBlock = new TBlock();
  pointBlock = new PointBlock();
  oBlock = new OBlock();
  currentBlock = new CurrentBlock();

  pointblock = new PointBlock();
  oblock = new OBlock();
  commaBlock = new CommaBlock();

  control = new Control();
  sBlock = new SBlock();
  zBlock = new ZBlock();

  blockPlace = new Location();

  jBlock = new JBlock();

  score = new Score();

  lBlock = new Lblock();
  iBlock = new IBlock();

  fullScreen();
  gameOn = true;
  dt = 1000;

  reset();
}


//beep = new SoundFile(this, "beep.wav");
//bgmusic = new SoundFile(this, "background_music.wav");


  //beep = new SoundFile(this, "beep.wav");
  //bgmusic = new SoundFile(this, "background_music.wav");







//bgmusic.loop();


//bgmusic.loop();







void reset() {
  //PLEASE HELP HERE -- KIANO
}

void draw()
{
  background(255);
  if (!score.GameOver && home.gameStart) {
    grid.drawGrid();
    blockPlace.fills();
    score.scoreDraw();
    score.scoreCounter();
    grid.gridClear();
    currentBlock.newBlock();
    currentBlock.currentBlockDraw();
    blockPlace.check();
    currentBlock.currentBlockControlls();
    control.controllsV3();
    if (grid != null) {
      grid.drawGrid();
      int now = millis();
      if (gameOn) {
        if (home.e == true) {
          if (now - currentTime > dt) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Easy difficulty, Easy difficulty gaat om de 1000 milliseconde 1 blokje omlaag.
          }
        }
      }
      if (gameOn) {
        if (home.m == true) {
          if (now - currentTime > 500) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Medium difficulty, Medium difficulty gaat om de 500 milliseconde 1 blokje omlaag
          }
        }
      }
      if (gameOn) {
        if (home.h == true) {
          if (now - currentTime > 200) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Hard difficulty, Hard difficulty gaat om de 200 milliseconde 1 blokje omlaag
          }
        }
      }
    }
  }
  stroke(255, 0, 0);
  strokeWeight(4);
  line(0, height*0.409, width, height*0.409);
  strokeWeight(1);
  if (score.GameOver) {
    score.gameOver();
    
    }
    
    

  //if (!score.GameOver && !home.gameStart){
  home.homeDraw();

  //}
}

void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;

  if (key == ENTER) {
    home.level = true;
  }

  if (keyCode == 49 || keyCode == 97) {
    home.gameStart = true;
    home.level = false;
    home.e = true;
    // difficulty = easy
  }
  if (keyCode == 50 || keyCode == 98) {
    home.gameStart = true;
    home.level = false;
    home.m = true;
    // difficulty = medium
  }
  if (keyCode == 51 || keyCode == 99) {
    home.gameStart = true;
    home.level = false;
    home.h = true;
    // difficulty = hard
  }
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  if (keyCode == 65 || keyCode == 68) {
    control.cooldown1 = 0;
    control.firstPress = true;
  }

  /*if (keyPressed == true)//in milliseconds
   {
   image(img1, 0, 0);
   }
   else {
   //rest of the code
   image(img2, 0, 0);
   }*/
}
