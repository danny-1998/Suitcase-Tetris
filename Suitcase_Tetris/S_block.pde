// By Kiano Wortel

class SBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                   [0][1]
   *                [2][3]
   *               0 = main
   */

  int width0;
  int height0;
  int width1;
  int height1;
  int width2;
  int height2;
  int width3;
  int height3;

  SBlock() {
    width0=5;
    height0=10;
  }

  void SBlockDraw() {
    width1=width0+1;
    height1=height0;

    width2= width0-1;
    height2 = height0+1;

    width3= width0;
    height3=height0+1;


    grid.cells[width0][height0] = 1;
    grid.cells[width1][height1] = 1;
    grid.cells[width2][height2] = 1;
    grid.cells[width3][height3] = 1;
  }
}
