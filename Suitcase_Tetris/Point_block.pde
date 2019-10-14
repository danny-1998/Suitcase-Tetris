// By Kiano Wortel

class PointBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                [0]
   *I mean, it kinda speaks for itself
   */

  int mainBlockX;
  int mainBlockY;
  int minX, maxX;

  PointBlock() {
    mainBlockX=6;
    mainBlockY=13;
    minX = mainBlockX;
    maxX = mainBlockX;
  }

  void PointBlockDraw() {
    grid.cells[mainBlockX][mainBlockY] = 1;
  }
}
