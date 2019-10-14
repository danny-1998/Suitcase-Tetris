// By Kiano Wortel

class SBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                   [0][1]
   *                [2][3]
   *               0 = main
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
  boolean onEdgeLeft, onEdgeRight;

  SBlock() {
    mainBlockX=5;
    mainBlockY=10;
  }

  void SBlockDraw() {
    width1=mainBlockX+1;
    height1=mainBlockY;

    width2= mainBlockX-1;
    height2 = mainBlockY+1;

    width3= mainBlockX;
    height3=mainBlockY+1;

    minX = mainBlockX-1;
    maxX = mainBlockX+1;

    if (mainBlockX == 0) {            
      onEdgeLeft = true;
    } else {
      onEdgeLeft = false;
    }

    if (mainBlockX == grid.w-1) {   
      onEdgeRight = true;
    } else {
      onEdgeRight = false; 

      grid.cells[mainBlockX][mainBlockY] = 1;
      grid.cells[width1][height1] = 1;
      grid.cells[width2][height2] = 1;
      grid.cells[width3][height3] = 1;
    }
  }
}
