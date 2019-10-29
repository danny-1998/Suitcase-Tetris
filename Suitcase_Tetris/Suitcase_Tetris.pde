PImage img1, img2;
Grid grid;
TBlock tBlock;

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
CurrentBlock currentBlock;

Location blockPlace;

Score score;

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


  fullScreen();
  blockPlace.setup();
}

void draw()
{
  background(255);
  grid.drawGrid();
  blockPlace.draw();
  grid.gridClear();

  currentBlock.newBlock();


  //tBlock.TBlockDraw();
  //pointBlock.PointBlockDraw();
  //oBlock.OBlockDraw();
  //sBlock.SBlockDraw();

  currentBlock.currentBlockDraw();
  currentBlock.currentBlockControlls();
  //control.movement();
  control.keyPressed();
  score.scoreDraw();
  
  
  /*if(keyPressed == true){
      println(key);
    if(key == '0' ){
     currentBlock.blockPicker += 1;
     println(currentBlock.blockPicker);
    }
  }*/
  

  /*if (keyPressed == true)//in milliseconds
   {
   image(img1, 0, 0);
   }
   else {
   //rest of the code
   image(img2, 0, 0);
   }*/
}
