class TBlock {
  /* By Ole Neuman
   *diagram of how im coding this T_Block in the grid:
   *                [0]
   *             [1][M][3]
   * Where block M is my mainBlock, and the coördinates of the other blocks depend on the coördinate of the main block
   */
  int mainBlockX, mainBlockY;   //the sets of coördinates for each cube of the T_Block
  int block0X, block0Y;
  int block1X, block1Y;
  int block3X, block3Y;
  
  boolean onEdgeLeft, onEdgeRight;              //if the block is right up to the wall, is used so that the rotate function doesnt rotate a piece outside of the array
  int minX, maxX;              //the minimum and maximum X value the block can have before going outside of the array, and thus crashing the program 

  TBlock() {
    mainBlockX = 12;
    mainBlockY =  1;
  }

  void TBlockDraw() {
    if (control.rotation == 0) {            //      [0]
      block0X = mainBlockX;                 //   [1][M][3]
      block0Y = mainBlockY-1;

      block1X = mainBlockX-1;
      block1Y = mainBlockY;

      block3X = mainBlockX+1;
      block3Y = mainBlockY;
      
      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      
    } else 
    if (control.rotation == 1) {           //     [1]
      block0X = mainBlockX+1;              //     [M][0]
      block0Y = mainBlockY;                //     [3]

      block1X = mainBlockX;
      block1Y = mainBlockY-1;

      block3X = mainBlockX;
      block3Y = mainBlockY+1;
      
      minX = mainBlockX;
      maxX = mainBlockX+1;
      
    } else
      if (control.rotation == 2) {        //   [3][M][1]
        block0X = mainBlockX;             //      [0]
        block0Y = mainBlockY+1;

        block1X = mainBlockX+1;
        block1Y = mainBlockY;

        block3X = mainBlockX-1;
        block3Y = mainBlockY;
        
        minX = mainBlockX-1;
        maxX = mainBlockX+1;
        
      } else
        if (control.rotation == 3) {      //      [3]
          block0X = mainBlockX-1;         //   [0][M]
          block0Y = mainBlockY;           //      [1]

          block1X = mainBlockX;
          block1Y = mainBlockY+1;

          block3X = mainBlockX;
          block3Y = mainBlockY-1;
          
          minX = mainBlockX-1;
          maxX = mainBlockX;
          
        }                           //                                    |[1]
    if(mainBlockX == 0){            //if the piece is up to the wall like |[M][0]
    onEdgeLeft = true;              //                                    |[3]
    }else{
     onEdgeLeft = false; 
    }
                                   //                                       [3]|
    if(mainBlockX == grid.w-1){    //if the piece is up to the wall like [0][M]|
     onEdgeRight = true;           //                                       [1]|
    }else{
     onEdgeRight = false; 
    }
    
    
    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block0X][block0Y] = 1;
    grid.cells[block1X][block1Y] = 1; //<>//
    grid.cells[block3X][block3Y]  = 1;
  }
}
