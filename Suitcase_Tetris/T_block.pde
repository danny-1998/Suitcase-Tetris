class TBlock { //<>// //<>// //<>//
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

  boolean onEdgeLeft, onEdgeRight; //if the piece is next to the wall, and has a possibility of rotating outside of the array, the boolean is true
  boolean wallClockwise, wallAnticlockwise; //if you would rotate the piece clockwise or anticlockwise, and it would end up outside of the array, the boolean is true. This is used in the controlls to make sure that doesnt happen
  int minX, maxX;              //the minimum and maximum X value the block can have before going outside of the array, and thus crashing the program 
  int maxY;
  TBlock() {
    mainBlockX = 11;
    mainBlockY =  1;
  }

  void TBlockDraw() {
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    if (control.rotation == 0) {            //      [0]
      block0X = mainBlockX;                 //   [1][M][3]
      block0Y = mainBlockY-1;

      block1X = mainBlockX-1;
      block1Y = mainBlockY;

      block3X = mainBlockX+1;
      block3Y = mainBlockY;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY;

      wallClockwise = false;
      wallAnticlockwise = false;
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
      maxY = mainBlockY+1;

      wallClockwise = true;
      wallAnticlockwise = true;
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
        maxY = mainBlockY+1;

        wallClockwise = false;
        wallAnticlockwise = false;
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
          maxY = mainBlockY+1;

          wallClockwise = true;
          wallAnticlockwise = true;
        }                             //                                    |[1]
    if (mainBlockX == 0) {            //if the piece is up to the wall like |[M][0]
      onEdgeLeft = true;              //                                    |[3]   
    } else {
      onEdgeLeft = false;
    }
                                     //                                       [3]|
    if (mainBlockX == grid.w-1) {    //if the piece is up to the wall like [0][M]|
      onEdgeRight = true;            //                                       [1]|
    } else {
      onEdgeRight = false;
    }


    if (control.rotation == 0) {
      if (mainBlockX > 1) { 
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 3) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {
      if (mainBlockX > 0) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    currentBlock.currentBlockX = mainBlockX;
    currentBlock.currentBlockY = mainBlockY;

    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block0X][block0Y] = 1;
    grid.cells[block1X][block1Y] = 1;
    grid.cells[block3X][block3Y] = 1;
  }
}
