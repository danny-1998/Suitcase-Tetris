PImage img1, img2;
Grid grid;

void setup()
{
  //img1 = loadImage("1.jpg");
  //img2 = loadImage("2.jpg");
  grid = new Grid();
  fullScreen();
}

void draw()
{
  background(0);
  grid.drawGrid();
  /*if (keyPressed == true)//in milliseconds
  {
    image(img1, 0, 0);
  }
  else {
    //rest of the code
    image(img2, 0, 0);
  }*/
}
