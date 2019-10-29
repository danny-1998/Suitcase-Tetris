// By Kiano Wortel

class ZBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                   [1][0]
   *                      [2][3]
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

  ZBlock() {
    mainBlockX=5;
    mainBlockY=10;
  }

  void ZBlockDraw() {
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0) {              //   [1][0]
      width1=mainBlockX-1;                    //      [2][3]
      height1=mainBlockY;

      width2= mainBlockX;
      height2 = mainBlockY+1;

      width3= mainBlockX+1;
      height3=mainBlockY+1;
    } else 
    if (control.rotation == 1) {        //        [1]
      width1 = mainBlockX;              //     [2][0]
      height1 = mainBlockY-1;           //     [3]

      width2 = mainBlockX+1;
      height2 = mainBlockY+1;

      width3 = mainBlockX+1;
      height2 = mainBlockY;

      minX = mainBlockX-1;
      maxX = mainBlockX;
    } else
      if (control.rotation == 2) {           //      [1][0]
        width1=mainBlockX+1;                    //      [2][3]
        height1=mainBlockY;

        width2= mainBlockX-1;
        height2 = mainBlockY+1;

        width3= mainBlockX;
        height3=mainBlockY+1;

        minX = mainBlockX-1;
        maxX = mainBlockX+1;
      } else
        if (control.rotation == 3) {          //      [1]
          width1 = mainBlockX;              //     [2][0]
          height1 = mainBlockY-1;           //     [3]

          width2 = mainBlockX+1;
          height2 = mainBlockY+1;

          width3 = mainBlockX+1;
          height2 = mainBlockY;

          minX = mainBlockX-1;
          maxX = mainBlockX;
        }    

    if (control.rotation == 3 || control.rotation == 1) {
      minX = mainBlockX;
      maxX = mainBlockX+1;
    } else
      if (control.rotation == 0 || control.rotation == 2) {
        minX = mainBlockX-1;
        maxX = mainBlockX+1;
      }

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
