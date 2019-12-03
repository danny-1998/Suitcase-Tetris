class Location {
  //Door Yves Prinz
  /* Deze class houd de positie en oriëntatie van de CurrentBlock bij als deze iets onder zich raakt, de bodem  of een ander blok.
   vervolgens slaat het die informatie op zodat dit blok ook getekend blijft,
   en geeft een signaal aan de CurrentBlock dat deze een nieuw blok mag maken.
   */
  //int test = 0;
  int spriteX[] = new int[500];
  int spriteY[] = new int[500];
  int spritewah[] = new int [500];
  int sprite;
  int ghosty = 940;

  int uwu;
  int filled[][] = new int[grid.w][grid.h]; // welke plekken op de grid gevult moeten zijn
  boolean land = false; // geeft aan wanneer een block de vloer of een ander blok onder zich aanraakt
  boolean _new = false; // als deze true is moet er een nieuw blok verschijnen
  boolean check = false; // tussenvariabele om te kijken of het gehele 'maak een nieuw blok' proces goed gaat

  void setup() { // hier wordt de filled variabele gevuld met waarden zodat er geen error ontstaat zodra deze opgeroepen wordt voor de eerste keer.
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        filled[i][b] = 0;
      }
    }
    for ( int i = 0; i <24; i++) {
      //spriteN[i] = new PImage
    }
    
   /*for (int a = 0; a < 500; a++) {
      for (int b = 0; b < 500; b++) {
        for (int c = 0; c < 500; c++) {
          spriteX[a] = 2000;
          spriteY[b] = 2000;
          spritewah[c] = 0;
        }
      }
    }
    */
  }
  

  void check() {
    
    //image(kerst, (currentBlock.maxX*50)+240, (currentBlock.currentBlockY*50)-90);
    if(kerstmode){
    tint(255,50);
    image(kerst, (currentBlock.maxX*50)+240, (currentBlock.currentBlockY*50)-90);
    tint(255,255);
    }
    
    //for (int a =0; a <24; a++) {
    //  println(spriteN[a]);
    //}
    //grid.cells[12][10] = 1; //blok wat altijd aan is voor collision testing

    //println(tBlock.maxY);
    //in de komende if statements wordt er gekeken naar de verschillende blokken formaties en wanneer er een blok eronder aanwezig is.
    //gezien ieder blok een andere vorm heeft, moet ze allemaal op een andere manier worden gecheckt
    if (currentBlock.blockPicker == 1) {// t-block
      if ((tBlock.maxY >= grid.h-1) ||
        ((grid.cells[tBlock.mainBlockX][tBlock.maxY+1] == 1) ||
        ((grid.cells[tBlock.minX][tBlock.mainBlockY+1] == 1) && (tBlock.minX != tBlock.mainBlockX)) ||
        ((grid.cells[tBlock.maxX][tBlock.mainBlockY+1] == 1) && (tBlock.maxX != tBlock.mainBlockX)) ) ) {
        //println("hier is de bodem");
        land = true;
        //noLoop();
      } else {
        land =false;
      }
    }
    if (currentBlock.blockPicker == 2) {// o-block
      if ((oBlock.maxY >= grid.h-1) || (grid.cells[oBlock.width2][oBlock.maxY+1] == 1) || (grid.cells[oBlock.width3][oBlock.maxY+1] == 1) ) {
        land = true;
        //noLoop();
      } else {
        land =false;
      }
    }
    if (currentBlock.blockPicker == 3) {// point-block
      //println(pointBlock.mainBlockY);
      if ((pointBlock.mainBlockY >= grid.h-1) || (grid.cells[pointBlock.mainBlockX][pointBlock.mainBlockY+1] == 1)/**/) {
        //println(pointBlock.mainBlockY);
        land = true;
        //noLoop();
      } else {
        land =false;
      }
    }
    if (currentBlock.blockPicker == 4) {// s-block
      if ((sBlock.maxY >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[sBlock.maxX][sBlock.maxY+1] == 1) || (grid.cells[sBlock.minX][sBlock.maxY]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[sBlock.minX][sBlock.maxY+1] == 1) || (grid.cells[sBlock.mainBlockX][sBlock.maxY+1]==1)|| (grid.cells[sBlock.maxX][sBlock.maxY]==1)))
        ) {
        land = true;
        //noLoop();
      } else {
        land =false;
      }
    }
    if (currentBlock.blockPicker == 5) {// z-block
      if ((zBlock.maxY >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[zBlock.minX][zBlock.maxY+1] == 1) || (grid.cells[zBlock.maxX][zBlock.maxY]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[zBlock.maxX][zBlock.maxY+1] == 1) || (grid.cells[zBlock.mainBlockX][zBlock.maxY+1]==1)|| (grid.cells[zBlock.minX][zBlock.maxY]==1)))
        ) {
        land = true;
        //noLoop();
      } else {
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
      } else {
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
      } else {
        land =false;
      }
    }
    if (currentBlock.blockPicker == 8) {// comma-block
      if ((commaBlock.maxY >= grid.h-1)||
        (grid.cells[commaBlock.mainBlockX][commaBlock.maxY+1] == 1)||
        ((grid.cells[commaBlock.minX][commaBlock.mainBlockY+1] == 1) && (commaBlock.minX != commaBlock.mainBlockX ))||
        ((grid.cells[commaBlock.maxX][commaBlock.mainBlockY+1] == 1) && (commaBlock.maxX != commaBlock.mainBlockX))
        ) {
        land = true;
        //noLoop();
      } else {
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
      } else {
        land =false;
      }
    }
    for (int a = 0; a <uwu; a++) {
      image(spriteN[spritewah[a]], spriteX[a], spriteY[a]);
      }
      for (int i = currentBlock.currentBlockY; i < grid.h-1; i++){
        if(grid.cells[currentBlock.currentBlockX][i] == 1){
          ghosty-=50;
        }
      }
      tint(255, 50);
      image(spriteN[currentBlock.blockPicker*control.rotation], (currentBlock.currentBlockX*50)+350, ghosty);
      tint(255, 255);
      ghosty = 940;
    //image(spriteN[0], 500, 500);
    //println(uwu+1); //hoeveel blokken er op het scherm zijn
  }
  //dit waren de 'bottom checks'

  void fills() { //deze functie zorgt er voor dat als er een tetrimino klaar is met vallen, de blokken waar de tetrimino uit bestond onderdeel worden van de stage zodat het volgende blok er op kan vallen.
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        if ((grid.cells[i][b] == 1) && (check == true)) {
          filled[i][b] = grid.cells[i][b]; //eerst worden alle velden die al actief waren gekopieërd naar de variabele 'filled'
          _new = true;
        }
        if (filled[i][b] == 1) {
          grid.cells[i][b] = filled[i][b]; // dan worden hier alle cells in de grid gelijk gemaakt aan 'filled'. filled bestaat nu uit grid.cells en het nieuwe, net gevallen blok.
        }
      }
    }



    if (_new == true) { //hier wordt aan de currentBlock class gemeld dat er een nieuw blok moet komen nu dat het veld compleet is.
      _new = false;
      // in dit gedeelte wordt een sprite gelinkt aan een onderdeel van de sprite arrays om er voor te zorgen dat de sprites blijven zodra een blok geplaatst is.
      //rotatie 1
      if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ZeroX; spriteY[uwu] = tBlock.ZeroY; spritewah[uwu] = 8; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ZeroX; spriteY[uwu] = sBlock.ZeroY; spritewah[uwu] = 6; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ZeroX; spriteY[uwu] = zBlock.ZeroY; spritewah[uwu] = 7; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ZeroX; spriteY[uwu] = jBlock.ZeroY; spritewah[uwu] = 2; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ZeroX; spriteY[uwu] = lBlock.ZeroY; spritewah[uwu] = 3; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ZeroX; spriteY[uwu] = commaBlock.ZeroY; spritewah[uwu] = 0; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1; uwu+=1;}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.OneX; spriteY[uwu] = tBlock.OneY; spritewah[uwu] = 15; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.OneX; spriteY[uwu] = sBlock.OneY; spritewah[uwu] = 13; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.OneX; spriteY[uwu] = zBlock.OneY; spritewah[uwu] = 14; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.OneX; spriteY[uwu] = jBlock.OneY; spritewah[uwu] = 11; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.OneX; spriteY[uwu] = lBlock.OneY; spritewah[uwu] = 12; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.OneX; spriteY[uwu] = commaBlock.OneY; spritewah[uwu] = 9; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10; uwu+=1;}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.TwoX; spriteY[uwu] = tBlock.TwoY; spritewah[uwu] = 19; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.TwoX; spriteY[uwu] = sBlock.TwoY; spritewah[uwu] = 6; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.TwoX; spriteY[uwu] = zBlock.TwoY; spritewah[uwu] = 7; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.TwoX; spriteY[uwu] = jBlock.TwoY; spritewah[uwu] = 17; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.TwoX; spriteY[uwu] = lBlock.TwoY; spritewah[uwu] = 18; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.TwoX; spriteY[uwu] = commaBlock.TwoY; spritewah[uwu] = 16; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1; uwu+=1;}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ThreeX; spriteY[uwu] = tBlock.ThreeY; spritewah[uwu] = 23; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ThreeX; spriteY[uwu] = sBlock.ThreeY; spritewah[uwu] = 13; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ThreeX; spriteY[uwu] = zBlock.ThreeY; spritewah[uwu] = 14; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ThreeX; spriteY[uwu] = jBlock.ThreeY; spritewah[uwu] = 21; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ThreeX; spriteY[uwu] = lBlock.ThreeY; spritewah[uwu] = 22; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ThreeX; spriteY[uwu] = commaBlock.ThreeY; spritewah[uwu] = 20; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10; uwu+=1;}
      }
      
      currentBlock.newBlock = true;
      check = false;
    }
  }

  void filledClear() {
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        filled[i][b] = 0;
      }
    }
  }
}
