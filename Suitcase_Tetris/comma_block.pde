class CommaBlock { 

  /*diagram of how im coding this comma_Block in the grid:
   *                [0]
   *                [1][2]
   *               1 = main
   */

  int mainBlockX, mainBlockY;
  int block0X, block0Y;
  int block2X, block2Y;
  int minX, maxX;
  boolean onEdgeLeft, onEdgeRight;

  CommaBlock() {
    mainBlockX = 6;
    mainBlockY = 6;
  }

  void CommaBlockDraw () {
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    
    if (control.rotation == 0) {
      block0X = mainBlockX;                  // the block looks like this:
      block0Y = mainBlockY - 1;              //        [0]
                                             //        [M][2]              
      block2X = mainBlockX + 1;
      block2Y = mainBlockY;
      
      minX = mainBlockX;
      maxX = mainBlockX + 1;
    }
    
    if (control.rotation == 1) {
      block0X = mainBlockX + 1;              // the block looks like this:
      block0Y = mainBlockY;                  //        [M][0]
                                             //        [2]
      block2X = mainBlockX;
      block2Y = mainBlockY + 1;
      
      minX = mainBlockX;
      maxX = mainBlockX + 1;
    }
    
    if (control.rotation == 2) {
      block0X = mainBlockX;                  // the block looks like this:
      block0Y = mainBlockY + 1;              //     [2][M]
                                             //        [0]
      block2X = mainBlockX - 1;
      block2Y = mainBlockY;
      
      minX = mainBlockX - 1;
      maxX = mainBlockX;
    }
    
    if (control.rotation == 3) {
      block0X = mainBlockX - 1;              // the block looks like this:
      block0Y = mainBlockY;                  //        [2]
                                             //     [0][M]
      block2X = mainBlockX;
      block2Y = mainBlockY - 1;
      
      minX = mainBlockX - 1;
      maxX = mainBlockX;
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
    }
    
    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block0X][block0Y] = 1;
    grid.cells[block2X][block2Y] = 1;
  }
}
