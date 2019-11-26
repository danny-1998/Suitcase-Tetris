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
ZeroX = mainBlockX*50+350;
   ZeroY = mainBlockY*50+40;
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    image(spriteN[5], ZeroX, ZeroY);
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
  }
}
