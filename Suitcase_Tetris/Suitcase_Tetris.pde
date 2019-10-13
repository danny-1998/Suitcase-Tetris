PImage img1, img2;
Grid grid;
TBlock tBlock;
PointBlock pointblock;
OBlock oblock;
SBlock sblock;
Control control;
void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  tBlock = new TBlock();
  pointblock = new PointBlock();
  oblock = new OBlock();
  control = new Control();
  sblock = new SBlock();
  fullScreen();
}

void draw()
{
  background(255);
  grid.drawGrid();
  grid.gridClear();
  tBlock.TBlockDraw();
  pointblock.PointBlockDraw();
  oblock.OBlockDraw();
  sblock.SBlockDraw();
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
