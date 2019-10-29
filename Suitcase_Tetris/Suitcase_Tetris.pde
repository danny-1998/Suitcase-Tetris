import processing.sound.*;
PImage img1, img2;
SoundFile beep, bgmusic;
Grid grid;
TBlock tBlock;
Location blockPlace;
PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;

ZBlock zBlock;
JBlock jBlock;
Lblock lblock;
IBlock iBlock;


PointBlock pointblock;
OBlock oblock;
CommaBlock commaBlock;

Control control;
CurrentBlock currentBlock, nextPiece;
Score score;
boolean gameOn;
int dt, currentTime;
void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
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

  lblock = new Lblock();
  iBlock = new IBlock();

  //fullScreen();
  size(1920, 1080);
  gameOn = true;
  dt = 1000;
  beep = new SoundFile(this, "beep.wav");
  bgmusic = new SoundFile(this, "background_music.wav");
  bgmusic.loop();
  
}

void draw()
{
  background(255);
  //blockPlace.draw();
  grid.drawGrid();
  grid.gridClear();

  currentBlock.newBlock();


  //tBlock.TBlockDraw();
  //pointBlock.PointBlockDraw();
  //oBlock.OBlockDraw();
  //sBlock.SBlockDraw();

  currentBlock.currentBlockDraw();
  currentBlock.currentBlockControlls();

 // tBlock.TBlockDraw();
  //pointblock.PointBlockDraw();
  //oblock.OBlockDraw();
 // commaBlock.CommaBlockDraw();

  control.movement();
  score.scoreDraw();
  if(grid != null){
    grid.drawGrid();
    int now = millis();
    if (gameOn) {
      if (now - currentTime > dt) {
        currentTime = now;
        if(currentBlock.currentBlockY < grid.h-1) {
          currentBlock.oneStepDown();
          beep.play();
          println("dropping down" + " Position of block:" + currentBlock.currentBlockY + " Grid height:" + grid.h);
        } else if(currentBlock.currentBlockY == grid.h-1){
          currentBlock = new CurrentBlock();
          currentBlock.newBlock();
          println("new block");
        }
      }
    }
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
