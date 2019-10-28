PImage img1, img2;
Grid grid;
TBlock tBlock;

PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;

ZBlock zBlock;
JBlock jBlock;
Lblock lblock;


PointBlock pointblock;
OBlock oblock;
CommaBlock commaBlock;

Control control;
CurrentBlock currentBlock;
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
  jBlock = new JBlock();
<<<<<<< Updated upstream
  score = new Score();
=======
  lblock = new Lblock();
>>>>>>> Stashed changes
  fullScreen();
}

void draw()
{
  background(255);
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
  

  /*if (keyPressed == true)//in milliseconds
   {
   image(img1, 0, 0);
   }
   else {
   //rest of the code
   image(img2, 0, 0);
   }*/
}
