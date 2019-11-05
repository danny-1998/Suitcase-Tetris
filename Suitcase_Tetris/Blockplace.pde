class Location {
  //By Yves Prinz
  /* Deze class houd de positie en oriëntatie van de CurrentBlock bij als deze iets onder zich raakt, de bodem  of een ander blok.
   vervolgens slaat het die informatie op zodat dit blok ook getekend blijft,
   en geeft een signaal aan de CurrentBlock dat deze een nieuw blok mag maken.
   */
  //int test = 0;
  int filled[][] = new int[grid.w][grid.h]; // welke plekken op de grid gevult moeten zijn
  boolean B_lock = false; // geeft aan wanneer een block klaar is
  boolean _new = false;

  void setup() {
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        filled[i][b] = 0;
      }
    }
  }

  void draw() {
    //grid.cells[12][10] = 1; //blok wat altijd(?) aan is voor collision testing

    //println(tBlock.maxY);
    if (currentBlock.blockPicker == 1) {// t-block
      if ((tBlock.maxY >= grid.h-1) ||
      ((grid.cells[tBlock.mainBlockX][tBlock.maxY+1] == 1) ||
      ((grid.cells[tBlock.minX][tBlock.mainBlockY+1] == 1) && (tBlock.minX != tBlock.mainBlockX)) ||
      ((grid.cells[tBlock.maxX][tBlock.mainBlockY+1] == 1) && (tBlock.maxX != tBlock.mainBlockX)) ) ) {
        //println("hier is de bodem");
        B_lock = true;
        //noLoop();
      }
    }
    if (currentBlock.blockPicker == 2) {// o-block
      if ((oBlock.maxY >= grid.h-1) || (grid.cells[oBlock.width2][oBlock.maxY+1] == 1) || (grid.cells[oBlock.width3][oBlock.maxY+1] == 1) ) {
        //println("hier is de bodem");
        B_lock = true;
        //noLoop();
      }
    }
    if (currentBlock.blockPicker == 3) {// point-block
    println(pointBlock.mainBlockY);
      if ((pointBlock.mainBlockY >= grid.h-1) || (grid.cells[pointBlock.mainBlockX][pointBlock.mainBlockY+1] == 1)/**/) {
        //println("hier is de bodem");
        //println(pointBlock.mainBlockY);
        B_lock = true;
        //noLoop();
      }
    }
    if (currentBlock.blockPicker == 4) {// s-block
      if (sBlock.maxY >= grid.h-1) {
        //println("hier is de bodem");
        B_lock = true;
        //noLoop();
      }
    }
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        if ((grid.cells[i][b] == 1) && (B_lock == true)) {
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
      B_lock = false;
      
    }
  }
}
