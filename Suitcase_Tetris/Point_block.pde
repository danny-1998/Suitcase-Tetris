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

  PointBlock() {
    mainBlockX=6;
    mainBlockY=13;
    minX = mainBlockX;
    maxX = mainBlockX;
  }

  void PointBlockDraw() {

    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    grid.cells[mainBlockX][mainBlockY] = 1;
    minX = mainBlockX;
    maxX = mainBlockX;
    maxY = mainBlockY;
  }
}
