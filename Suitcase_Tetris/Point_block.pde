// By Kiano Wortel

class PointBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                [0]
   *I mean, it kinda speaks for itself
   */

  int mainBlockX;
  int mainBlockY;
  int minX, maxX;
  int maxY;
  int ZeroX;
  int ZeroY;


  void PointBlockDraw() {
    if (mainBlockX > 0) {
          if (grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 1) {
          if (grid.cells[mainBlockX+1][mainBlockY] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
    
    grid.cells[mainBlockX][mainBlockY] = 1;
    minX = mainBlockX;
    maxX = mainBlockX;
    maxY = mainBlockY;
    ZeroX = mainBlockX*50+350;
   ZeroY = mainBlockY*50+40;
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    //easy/tutoreal
    if (home.e == true || home.t == true){
        image(spriteN[5], ZeroX, ZeroY);
  }
  //balanced
  if (home.balanced == true){
  image(spriteN[5+24], ZeroX, ZeroY);
  }
  //insane
  if (home.h == true){
  image(spriteN[5+48], ZeroX, ZeroY);
  }
}
}
