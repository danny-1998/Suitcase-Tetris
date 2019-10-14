// By Kiano Wortel

class OBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                [0][1]
   *                [2][3]
   *               0 = mainBlock
   */

  int mainBlockX;
  int mainBlockY;
  int width1;
  int height1;
  int width2;
  int height2;
  int width3;
  int height3;
  int minX, maxX;

  OBlock() {
    mainBlockX=10;
    mainBlockY=10;
  }

  void OBlockDraw() {
    width1=mainBlockX+1;
    height1=mainBlockY;

    width2= mainBlockX;
    height2 = mainBlockY+1;

    width3= mainBlockX+1;
    height3=mainBlockY+1;

    minX = mainBlockX;
    maxX = mainBlockX+1;

    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[width1][height1] = 1;
    grid.cells[width2][height2] = 1;
    grid.cells[width3][height3] = 1;
  }
}
