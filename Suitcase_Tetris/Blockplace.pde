class Location {
  //By Yves Prinz
  /* Deze class houd de positie en oriëntatie van de CurrentBlock bij als deze iets onder zich raakt, de bodem  of een ander blok.
   vervolgens slaat het die informatie op zodat dit blok ook getekend blijft,
   en geeft een signaal aan de CurrentBlock dat deze een nieuw blok mag maken.
   */
  //int test = 0;
  int filled[][] = new int[grid.w][grid.h]; // welke plekken op de grid gevult moeten zijn
  boolean land = false; // geeft aan wanneer een block klaar is
  boolean _new = false;
  boolean check = false;

  void setup() {
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        filled[i][b] = 0;
      }
    }
  }

  void check() {
    //grid.cells[12][10] = 1; //blok wat altijd(?) aan is voor collision testing

    //println(tBlock.maxY);
    if (currentBlock.blockPicker == 1) {// t-block
      if ((tBlock.maxY >= grid.h-1) ||
        ((grid.cells[tBlock.mainBlockX][tBlock.maxY+1] == 1) ||
        ((grid.cells[tBlock.minX][tBlock.mainBlockY+1] == 1) && (tBlock.minX != tBlock.mainBlockX)) ||
        ((grid.cells[tBlock.maxX][tBlock.mainBlockY+1] == 1) && (tBlock.maxX != tBlock.mainBlockX)) ) ) {
        //println("hier is de bodem");
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 2) {// o-block
      if ((oBlock.maxY >= grid.h-1) || (grid.cells[oBlock.width2][oBlock.maxY+1] == 1) || (grid.cells[oBlock.width3][oBlock.maxY+1] == 1) ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 3) {// point-block
      println(pointBlock.mainBlockY);
      if ((pointBlock.mainBlockY >= grid.h-1) || (grid.cells[pointBlock.mainBlockX][pointBlock.mainBlockY+1] == 1)/**/) {
        //println(pointBlock.mainBlockY);
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 4) {// s-block
      if ((sBlock.maxY >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[sBlock.maxX][sBlock.maxY+1] == 1) || (grid.cells[sBlock.minX][sBlock.maxY]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[sBlock.minX][sBlock.maxY+1] == 1) || (grid.cells[sBlock.mainBlockX][sBlock.maxY+1]==1)|| (grid.cells[sBlock.maxX][sBlock.maxY]==1)))
        ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 5) {// z-block
      if ((zBlock.maxY >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[zBlock.minX][zBlock.maxY+1] == 1) || (grid.cells[zBlock.maxX][zBlock.maxY]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[zBlock.maxX][zBlock.maxY+1] == 1) || (grid.cells[zBlock.mainBlockX][zBlock.maxY+1]==1)|| (grid.cells[zBlock.minX][zBlock.maxY]==1)))
        ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 6) {// j-block
      if ((jBlock.maxY >= grid.h-1)||
        ((control.rotation == 0) && ((grid.cells[jBlock.minX][jBlock.maxY+1] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1]==1)))||
        ((control.rotation == 1) && ((grid.cells[jBlock.minX][jBlock.maxY+1] == 1) || (grid.cells[jBlock.mainBlockX][jBlock.maxY+1] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1] == 1)))||
        ((control.rotation == 2) && ((grid.cells[jBlock.minX][jBlock.maxY+1] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY-1] == 1)))||
        ((control.rotation == 3) && ((grid.cells[jBlock.minX][jBlock.maxY] == 1) || (grid.cells[jBlock.mainBlockX][jBlock.maxY] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1] == 1)))
        ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 7) {// l-block
      if ((lBlock.maxY >= grid.h-1)||
        ((control.rotation == 0) && ((grid.cells[lBlock.minX][lBlock.maxY+1] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1]==1)))||
        ((control.rotation == 3) && ((grid.cells[lBlock.minX][lBlock.maxY+1] == 1) || (grid.cells[lBlock.mainBlockX][lBlock.maxY+1] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1] == 1)))||
        ((control.rotation == 2) && ((grid.cells[lBlock.minX][lBlock.maxY-1] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1] == 1)))||
        ((control.rotation == 1) && ((grid.cells[lBlock.minX][lBlock.maxY+1] == 1) || (grid.cells[lBlock.mainBlockX][lBlock.maxY] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY] == 1)))
        ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 8) {// l-block
      if ((commaBlock.maxY >= grid.h-1)||
      (grid.cells[commaBlock.mainBlockX][commaBlock.maxY+1] == 1)||
      ((grid.cells[commaBlock.minX][commaBlock.mainBlockY+1] == 1) && (commaBlock.minX != commaBlock.mainBlockX ))||
      ((grid.cells[commaBlock.maxX][commaBlock.mainBlockY+1] == 1) && (commaBlock.maxX != commaBlock.mainBlockX))
        ) {
        land = true;
        //noLoop();
      }
        
        else{
          land =false;
        }
    }
    if (currentBlock.blockPicker == 9) {// i-block
      if ((iBlock.maxY >= grid.h-1)||
        ((control.rotation == 0 || control.rotation == 2) && (grid.cells[iBlock.minX][iBlock.maxY+1] == 1))||
        ((control.rotation == 1 || control.rotation == 3) && ((grid.cells[iBlock.block1X][iBlock.block1Y+1] == 1) || (grid.cells[iBlock.mainBlockX][iBlock.mainBlockY+1] == 1) || (grid.cells[iBlock.block3X][iBlock.block3Y+1] == 1) || (grid.cells[iBlock.block4X][iBlock.block4Y+1] == 1)))
        ) {
        land = true;
        //noLoop();
        }
        
        else{
          land =false;
        }
    }
  }
  void fills() {
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        if ((grid.cells[i][b] == 1) && (check == true)) {
          filled[i][b] = grid.cells[i][b];
          _new = true;
        }
        if (filled[i][b] == 1) {
          grid.cells[i][b] = filled[i][b];
        }
      }
    }
    if (_new == true) {
      _new = false;
      currentBlock.newBlock = true;
      check = false;
    }
  }
}
