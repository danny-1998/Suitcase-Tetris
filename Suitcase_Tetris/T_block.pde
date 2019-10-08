class TBlock {
  /*diagram of how im coding this T_Block in the grid:
   *                [0]
   *             [1][2][3]
   * Where block nr2 is my mainBlock, and the coördinates of the other blocks depend on the coördinate of the main block
   */
  int mainBlockX, mainBlockY;   //the sets of coördinates for each cube of the T_Block
  int block0X, block0Y;
  int block1X, block1Y;
  int block3X, block3Y;


  TBlock() {
    mainBlockX = 11;
    mainBlockY = 1;
  }

  void TBlockDraw() {
    if (control.rotation == 0) {            //      [0]
      block0X = mainBlockX;                 //   [1][M][3]
      block0Y = mainBlockY-1;

      block1X = mainBlockX-1;
      block1Y = mainBlockY;

      block3X = mainBlockX+1;
      block3Y = mainBlockY;
    } else 
    if (control.rotation == 1) {           //     [1]
      block0X = mainBlockX+1;              //     [M][0]
      block0Y = mainBlockY;                //     [3]

      block1X = mainBlockX;
      block1Y = mainBlockY-1;

      block3X = mainBlockX;
      block3Y = mainBlockY+1;
    } else
      if (control.rotation == 2) {        //   [3][M][1]
        block0X = mainBlockX;             //      [0]
        block0Y = mainBlockY+1;

        block1X = mainBlockX+1;
        block1Y = mainBlockY;

        block3X = mainBlockX-1;
        block3Y = mainBlockY;
      } else
        if (control.rotation == 3) {        //      [3]
          block0X = mainBlockX-1;         //   [0][M]
          block0Y = mainBlockY;           //      [1]

          block1X = mainBlockX;
          block1Y = mainBlockY+1;

          block3X = mainBlockX;
          block3Y = mainBlockY-1;
        }

    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block0X][block0Y] = 1;
    grid.cells[block1X][block1Y] = 1;
    grid.cells[block3X][block3Y]  = 1;
  }
}
