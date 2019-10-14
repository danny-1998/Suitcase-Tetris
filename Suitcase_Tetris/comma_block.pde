class CommaBlock { 

  /*diagram of how im coding this Point_Block in the grid:
   *                [0]
   *                [1][2]
   *               1 = main
   */

  int mainBlockX, mainBlockY;
  int block0X, block0Y;
  int block2X, block2Y;

  CommaBlock() {
    mainBlockX = 6;
    mainBlockY = 6;
  }

  void CommaBlockDraw () {
    block0X = mainBlockX;
    block0Y = mainBlockY - 1;
    
    block2X = mainBlockX + 1;
    block2Y = mainBlockY;
    
    grid.cells[mainBlockX][mainBlockY] = 1;
    grid.cells[block0X][block0Y] = 1;
    grid.cells[block2X][block2Y] = 1;
  }
}
