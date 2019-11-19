import processing.sound.*;
PImage img1, img2;

Grid grid;
TBlock tBlock;
Location blockPlace;
PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;

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

  loadAssets ();

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
<<<<<<< Updated upstream
  reset();
}
=======
  //beep = new SoundFile(this, "beep.wav");
  //bgmusic = new SoundFile(this, "background_music.wav");





  

  //bgmusic.loop();


  //bgmusic.loop();

>>>>>>> Stashed changes

void reset(){
//PLEASE HELP HERE -- KIANO
}

void draw()
{
  background(255);
  if (!score.GameOver) {
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
        if (now - currentTime > dt) {
          currentTime = now;
          if (currentBlock.currentBlockY < grid.h-1) {
            currentBlock.oneStepDown();
            beep.play();
            println("dropping down" + " Position of block:" + currentBlock.currentBlockY + " Grid height:" + grid.h);
          } else if (currentBlock.currentBlockY == grid.h-1) {
            currentBlock = new CurrentBlock();
            currentBlock.newBlock();
            println("new block");
          }
        }
      }
    }
  }
  if (score.GameOver) {
    score.gameOver();
  }
}

void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;

  if (key == ENTER) {
    reset();
  }
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  if (keyCode == LEFT || keyCode == RIGHT) {
    control.cooldown1 = 0;
    control.firstPress = true;
  }
}
