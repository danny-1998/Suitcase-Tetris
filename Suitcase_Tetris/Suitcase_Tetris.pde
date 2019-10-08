PImage img1, img2;
Grid grid;
TBlock tBlock;

void setup()
{
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  tBlock = new TBlock();
  fullScreen();
}

void draw()
{
  background(255);
  grid.drawGrid();
  tBlock.TBlockDraw();
  
  /*if (keyPressed == true)//in milliseconds
  {
    image(img1, 0, 0);
  }
  else {
    //rest of the code
    image(img2, 0, 0);
  }*/
}
