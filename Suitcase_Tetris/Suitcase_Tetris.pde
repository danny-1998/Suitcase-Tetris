PImage img1, img2;
Grid grid;
TBlock tBlock;
PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;
ZBlock zBlock;
JBlock jBlock;
Control control;
CurrentBlock currentBlock;
void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  tBlock = new TBlock();
  pointBlock = new PointBlock();
  oBlock = new OBlock();
  currentBlock = new CurrentBlock();
  control = new Control();
  sBlock = new SBlock();
  zBlock = new ZBlock();
  jBlock = new JBlock();
  fullScreen();
}

void draw()
{
  background(255);
  grid.drawGrid();
  grid.gridClear();
  currentBlock.newBlock();
  currentBlock.currentBlockDraw();
  currentBlock.currentBlockControlls();
  control.movement();
  

  /*if (keyPressed == true)//in milliseconds
   {
   image(img1, 0, 0);
   }
   else {
   //rest of the code
   image(img2, 0, 0);
   }*/
}
