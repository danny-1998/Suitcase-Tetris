// Nina Brochard

class IBlock {
  /*diagram of how im coding this I_Block in the grid:
   *                [1]
   *                [2]
   *                [3]
   *                [4]  2 = main
   */

  int mainBlockX;
  int mainBlockY;
  int block1X, block1Y;
  int block3X, block3Y;
  int block4X, block4Y;
  int minX, maxX;
  boolean onEdgeLeft, onEdgeRight;
  int maxY;

  void IBlockDraw () {
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0 || control.rotation == 2) {
      block1X = mainBlockX;
      block1Y = mainBlockY - 1;

      block3X = mainBlockX;              //    [1]
      block3Y = mainBlockY + 1;          //    [2]
                                         //    [3]
      block4X = mainBlockX;              //    [4]
      block4Y = mainBlockY + 2;

      minX = mainBlockX;
      maxX = mainBlockX;
      maxY = mainBlockY + 2;
    }

    if (control.rotation == 1 || control.rotation == 3) {
      block1X = mainBlockX - 1;
      block1Y = mainBlockY;

      block3X = mainBlockX + 1;          // [1][2][3][4]
      block3Y = mainBlockY;

      block4X = mainBlockX + 2;
      block4Y = mainBlockY;

      minX = mainBlockX - 1;
      maxX = mainBlockX + 2;
      maxY = mainBlockY;
    }

    if (mainBlockX == 0) {            
      onEdgeLeft = true;                  // makes sure the block doesn't go off the grid
    } else {
      onEdgeLeft = false;
    }

    if (mainBlockX == grid.w-1) {   
      onEdgeRight = true;
    } else {
      onEdgeRight = false;
    }
    
    if (control.rotation == 0 || control.rotation == 2) {              // all ofthe following code is for rotating the block
      if (mainBlockX > 0) { 
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0 || grid.cells[block4X-1][block4Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[block3X+1][block3Y] > 0|| grid.cells[block4X+1][block4Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1 || control.rotation == 3) {
      if (mainBlockX > 1) {
        if (grid.cells[block1X-1][block1Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 3) {
        if (grid.cells[block4X+1][block4Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    grid.cells[mainBlockX][mainBlockY] = 1;            // places the block on the grid
    grid.cells[block1X][block1Y] = 1;
    grid.cells[block3X][block3Y] = 1;
    grid.cells[block4X][block4Y] = 1;
  }
}
