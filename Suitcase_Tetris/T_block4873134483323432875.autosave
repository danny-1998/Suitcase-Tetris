class TBlock {
  /*diagram of how im coding this T_Block in the grid:
   *                [0]
   *             [1][2][3]
   * Where block nr2 is my mainBlock, and the coördinates of the other blocks depend on the coördinate of the main block
   */
  int mainBlockW, mainBlockH;   //the sets of coördinates for each cube of the T_Block
  int block0W, block0H;
  int block1W, block1H;
  int block3W, block3H;


  TBlock() {
    mainBlockW = 11;
    mainBlockH = 1;
    
    block0W = mainBlockW;
    block0H = mainBlockH-1;

    block1W = mainBlockW-1;
    block1H = mainBlockH;

    block3W = mainBlockW+1;
    block3H = mainBlockH;
  }

  void TBlockDraw() {
    grid.cells[mainBlockW][mainBlockH] = 1;
    grid.cells[block0W][block0H] = 1;
    grid.cells[block1W][block1H] = 1;
    grid.cells[block3W][block3H]  = 1;
  }
}
