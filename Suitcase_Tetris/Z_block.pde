// By Kiano Wortel

class ZBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                   [1][M]
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
  int maxY;
  int ZeroX;
  int ZeroY;
  int OneX;
  int OneY;
  int TwoX;
  int TwoY;
  int ThreeX;
  int ThreeY;
  boolean onEdgeLeft, onEdgeRight;
  boolean wallClockwise, wallAnticlockwise;
  ZBlock() {
    mainBlockX=5;
    mainBlockY=10;
  }

  void ZBlockDraw() {
    ZeroX = mainBlockX*50+300;
   ZeroY = mainBlockY*50+40;
   OneX = mainBlockX*50+300;
   OneY = mainBlockY*50-10;
   TwoX = mainBlockX*50+300;
   TwoY = mainBlockY*50+40;
   ThreeX = mainBlockX*50+300;
   ThreeY = mainBlockY*50-10;
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0 || control.rotation == 2) {              //   [1][M]
      width1=mainBlockX-1;                                             //      [2][3]
      height1=mainBlockY;

      width2= mainBlockX;
      height2 = mainBlockY+1;

      width3= mainBlockX+1;
      height3=mainBlockY+1;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY + 1;

      wallClockwise = false;
      wallAnticlockwise = false;
    } else 
    if (control.rotation == 1 || control.rotation == 3) {                      //        [1]
   grid.cells[currentBlock.currentBlockX][currentBlock.currentBlockY-1] = 1;   //     [2][M]
   grid.cells[currentBlock.currentBlockX-1][currentBlock.currentBlockY] = 1;   //     [3]
   grid.cells[currentBlock.currentBlockX][currentBlock.currentBlockY] = 1;
   grid.cells[currentBlock.currentBlockX-1][currentBlock.currentBlockY+1] = 1;
   
   width1 = mainBlockX;
   height1 = mainBlockY-1;
   
   width2 = mainBlockX-1;
   height2 = mainBlockY;
   
   width3 = mainBlockX-1;
   height3 = mainBlockY+1;
   
   minX = mainBlockX-1;
   maxX = mainBlockX;
   maxY = mainBlockY + 1;
            
      wallClockwise = true;
      wallAnticlockwise = true;
    }

    if (control.rotation == 3 || control.rotation == 1) {
      minX = mainBlockX-1;
      maxX = mainBlockX;
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
      
     if (control.rotation == 0) {
       image(spriteN[7], ZeroX, ZeroY);
      if (mainBlockX > 1) { 
        if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width3+1][height3] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {
      image(spriteN[14], OneX, OneY);
      if (mainBlockX > 1) {
        if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[width3-1][height3] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[width1+1][height1] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width3+1][height3] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      image(spriteN[7], TwoX, TwoY);
      if (mainBlockX > 1) { 
        if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width3+1][height3] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      image(spriteN[14], ThreeX, ThreeY);
     if (mainBlockX > 1) {
        if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[width3-1][height3] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[width1+1][height1] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width3+1][height3] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }
      

      grid.cells[mainBlockX][mainBlockY] = 1;
      grid.cells[width1][height1] = 1;
      grid.cells[width2][height2] = 1;
      grid.cells[width3][height3] = 1;
    }
  }
}
