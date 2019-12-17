import processing.sound.*;
PImage img1, img2;
boolean kerstmode = false;
int cool = 5;

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
Tutorial tutorial; 

PointBlock pointblock;
OBlock oblock;
CommaBlock commaBlock;

Control control;
CurrentBlock currentBlock, nextPiece;
Score score;
int now;
boolean gameOn;
float dt1, dt2, dt3, currentTime;
final int KEY_LIMIT = 1024;
float filledAmount = 0;
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
  tutorial = new Tutorial(); 
  dt1 = 1000;
  dt2 = 500;
  dt3 = 200;

  fullScreen();
  gameOn = true;

  reset();
  blockPlace.setup();
}


//beep = new SoundFile(this, "beep.wav");
//bgmusic = new SoundFile(this, "background_music.wav");


//beep = new SoundFile(this, "beep.wav");
//bgmusic = new SoundFile(this, "background_music.wav");







//bgmusic.loop();


//bgmusic.loop();







void reset() {
  //PLEASE HELP HERE -- KIANO
  //NOBODY WILL HELP YOU, THERE IS NO GOD HERE!!
}

void draw(){
  if (keyPressed == true){
    if ((key == 'k') || (key == 'K')){
      if (cool == 0)
      kerstmode = !kerstmode;
      cool = 5;
    }
  }
  if(cool > 0){
  cool--;
  }
  
  background(255);
  home.screenSelector();
  if (!score.GameOver && home.gameStart) {
    grid.drawGrid();
    blockPlace.fills();
    score.scoreDraw();
    score.filledCounter();
    score.scoreCounter();
    grid.gridClear();
    currentBlock.newBlock();
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 1) {image(spriteN[8], 130, 30 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 2) {image(spriteN[4], 150, 42 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 3) {image(spriteN[5], 175, 60 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 4) {image(spriteN[6], 125, 30 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 5) {image(spriteN[7], 125, 42 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 6) {image(spriteN[21], 130, 40 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 7) {image(spriteN[22], 130, 40 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 8) {image(spriteN[20], 150, 30 ); }
        if (currentBlock.blockOrder.get(currentBlock.blockCounter+1) == 9) {image(spriteN[10], 95, 60 ); }
    currentBlock.currentBlockDraw();
    blockPlace.check();
    currentBlock.currentBlockControlls();
    control.controllsV3();
    blockPlace.spawnAnim();
    if (grid != null) {
      grid.drawGrid();
      now = millis();
      if (gameOn) {
        if (home.e == true) {
          if (now - currentTime > dt1) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Easy difficulty, Easy difficulty gaat om de 1000 milliseconde 1 blokje omlaag.
          }
        }
      }
      if (gameOn) {
        if (home.m == true) {
          if (now - currentTime > dt2) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Medium difficulty, Medium difficulty gaat om de 500 milliseconde 1 blokje omlaag
          }
        }
      }
      if (gameOn) {
        if (home.h == true) {
          if (now - currentTime > dt3) {
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
  /*for (int i = 184; i<810; i++){
    print(" i = " + i + " ");
  print( 1000-(pow((500-i), 2))/100);
  }*/
   blockPlace.pointAnim();
}
void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;    //if a key is pressed that has a keyCode higher than the key limit, the function doesnt go further than this, so it doesnt potentially break anything
  keysPressed[keyCode] = true;         //if a key is pressed, it turns a boolean specific to that key to true, which gets used in the controlls
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;           //if a key is released that has a keyCode higher than the key limit, the function doesnt go further than this, so it doesnt potentially break anything
  keysPressed[keyCode] = false;               //when a key gets released, it switches a boolean specific to that key to false, which stops the input towards the controls
  if (keyCode == 65 || keyCode == 68) {       //if the a or d keys get released, it resets their cooldown, so that you can move more precise and at your own speed when tapping the controls, instead of holding them
    control.cooldown1 = 0;                    //it also re-engages the firstPress boolean, which helps with the accuracy of the controls
    control.firstPress = true;
  }
 if(keyCode == SHIFT){
    control.shiftLock = false;
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
