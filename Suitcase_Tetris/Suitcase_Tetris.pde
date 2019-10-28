PImage img1, img2;
Grid grid;
TBlock tBlock;
PointBlock pointBlock;
OBlock oBlock;
SBlock sBlock;
ZBlock zBlock;
Control control;
CurrentBlock currentBlock;
Location blockPlace;
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
  blockPlace = new Location();
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
  blockPlace.draw();
  
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
