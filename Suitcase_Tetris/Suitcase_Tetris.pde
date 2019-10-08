PImage img1, img2;
Grid grid;
TBlock tBlock;
Control control;
void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  tBlock = new TBlock();
  control = new Control();
  fullScreen();
}

void draw()
{
  background(255);
  grid.drawGrid();
  grid.gridClear();
  tBlock.TBlockDraw();
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
