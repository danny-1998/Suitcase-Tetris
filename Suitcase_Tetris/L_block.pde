// Nina Brochard

class Lblock {
  /*diagram of how im coding this L_Block in the grid:
   *                [1]
   *                [0]
   *                [2][3]
   *               0 = main
   */

  int mainBlockX;
  int mainBlockY;
  int block1X, block1Y;
  int block2X, block2Y;
  int block3X, block3Y;
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
  boolean wallClockwise, wallAnticlockwise;
  boolean onEdgeLeft, onEdgeRight;

  

  void LblockDraw () {
    ZeroX = mainBlockX*50+350;
   ZeroY = mainBlockY*50-10;
   OneX = mainBlockX*50+300;
   OneY = mainBlockY*50+40;
   TwoX = mainBlockX*50+300;
   TwoY = mainBlockY*50-10;
   ThreeX = mainBlockX*50+300;
   ThreeY = mainBlockY*50-10;
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0) {
      block1X = mainBlockX;
      block1Y = mainBlockY - 1;
                                          //    [1]
      block2X = mainBlockX;               //    [0]       
      block2Y = mainBlockY + 1;           //    [2][3]

      block3X = mainBlockX + 1;
      block3Y = mainBlockY + 1;

      minX = mainBlockX;
      maxX = mainBlockX+1;
      maxY = mainBlockY + 1;
      
      wallClockwise = true;
      wallAnticlockwise = true;
    }

    if (control.rotation == 1) {
      block1X = mainBlockX + 1;
      block1Y = mainBlockY;
                                          //    [2][0][1]      
      block2X = mainBlockX - 1;           //    [3]                    
      block2Y = mainBlockY;                     

      block3X = mainBlockX - 1;
      block3Y = mainBlockY + 1;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY + 1;
     
      wallClockwise = false;
      wallAnticlockwise = false;
    }

    if (control.rotation == 2) {
      block1X = mainBlockX;
      block1Y = mainBlockY + 1;
                                          //    [3][2]
      block2X = mainBlockX;               //       [0]       
      block2Y = mainBlockY - 1;           //       [1]

      block3X = mainBlockX - 1;
      block3Y = mainBlockY - 1;

      minX = mainBlockX-1;
      maxX = mainBlockX;
      maxY = mainBlockY + 1;
      
      wallClockwise = true;
      wallAnticlockwise = true;
    }

    if (control.rotation == 3) {
      block1X = mainBlockX - 1;
      block1Y = mainBlockY;
                                          //          [3]
      block2X = mainBlockX + 1;           //    [1][0][2]       
      block2Y = mainBlockY;           

      block3X = mainBlockX + 1;
      block3Y = mainBlockY - 1;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY;
      
      wallClockwise = false;
      wallAnticlockwise = false;
    }

    if (mainBlockX == 0) {            
      onEdgeLeft = true;
    } else {
      onEdgeLeft = false;                  // makes sure the block doesn't go off the grid
    }

    if (mainBlockX == grid.w-1) {   
      onEdgeRight = true;
    } else {
      onEdgeRight = false;
    }
    
    if (control.rotation == 0) {            // all of the following code is for rotating the block
     image(spriteN[3], ZeroX, ZeroY);
      if (mainBlockX > 0) { 
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[block2X-1][block2Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 ||  grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {
      image(spriteN[12], OneX, OneY);
      if (mainBlockX > 1) {
        if (grid.cells[block2X-1][block2Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      image(spriteN[18], TwoX, TwoY);
      if (mainBlockX > 1) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block2X+1][block2Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[block1X+1][block1Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      image(spriteN[22], ThreeX, ThreeY);
      if (mainBlockX > 1) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block2X+1][block2Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block1X][block1Y] = 1;                // places the block on the grid
    grid.cells[block2X][block2Y] = 1;
    grid.cells[block3X][block3Y] = 1;
  }
}
