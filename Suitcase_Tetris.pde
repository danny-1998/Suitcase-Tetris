PImage img1, img2;
void setup()
{
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");

  fullScreen();
}

void draw()
{
  background(0);
  if (keyPressed == true)//in milliseconds
  {
    image(img1, 0, 0);
  }
  else {
    //rest of the code
    image(img2, 0, 0);
  }
}
