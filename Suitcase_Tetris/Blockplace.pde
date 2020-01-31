class Location {
  //Door Yves Prinz
  /* Deze class houd de positie en oriëntatie van de CurrentBlock bij als deze iets onder zich raakt, de bodem  of een ander blok.
   vervolgens slaat het die informatie op zodat dit blok ook getekend blijft,
   en geeft een signaal aan de CurrentBlock dat deze een nieuw blok mag maken.
   dit beïnvloed de sprites en de daadwerkelijke blokken.
   */
  //int test = 0;
  //int win = 10;
  int spriteX[] = new int[500]; //de X postitie van een geplaatst blok
  int spriteY[] = new int[500]; //de Y postitie van een geplaatst blok
  int spritewah[] = new int [500]; //bewaart het nummer van de sprites van de geplaatste blokken.
  int point[] = new int [500]; // het aantal punten wat je krijgt voor het plaatsen van een blok.
  int b; // deze variabele wordt gebruikt voor het bijhouden van het score animatie effect's grootte.
  int roundCount = 50; // het aantal particles in het spawn-effect.
  int roundX[] = new int [roundCount]; // de x positie van de particles.
  int roundY[] = new int [roundCount]; // de y positie van de particles.
  float roundSize[] = new float[roundCount]; // de grootte van de particles.
  int rotate[] = new int [roundCount]; //
  int bott ; //de extra afstand die de ghostblock naar beneden moet
  int downCount; //het aantal blokken onder

  int uwu; //het aantal blokken op het scherm, waarbij ik verwijs naar de hele blok formaties, inclusief het blok dat op dit moment wordt bestuurt.
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
  

  void check() { //hier gebeuren de collission detection dingen. en kerst.
    //image(kerst, (currentBlock.maxX*50)+240, (currentBlock.currentBlockY*50)-90);
    if(kerstmode){ //als je kerst mode aan hebt staan wordt er een kerstmuts aan het vallende blok toegevoegd
    pushMatrix();// om te zorgen dat niks anders wordt beinvloed door de translate, rotate en scale functies.
    //tint(255,50);
    //image(kerst, (currentBlock.maxX*50)+240, (currentBlock.currentBlockY*50)-90);
    translate(1350,-220); //ik wil de muts een lichte angle geven, dus maak ik gebruik van translate om het wat practischer te maken.
    rotate(radians(30)); //rotate
    scale(1.7); //maakt de muts iets groter.
    image(kerst, 0,0);
    //tint(255,255);
    popMatrix();
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
    for (int a = 0; a <uwu; a++) { //hier worden de geplaatste blokken afgebeeld. des te meer blokken, des te hoger uwu wordt.
      //println(spritewah[a], spriteX[a], spriteY[a]);
      image(spriteN[spritewah[a]], spriteX[a], spriteY[a]);
      }
      
      /*for (int i = currentBlock.currentBlockY; i < grid.h-1; i++){
        if(grid.cells[currentBlock.currentBlockX][i] == 1){
          ghosty-=50;
        }
      }
      tint(255, 50);
      image(spriteN[currentBlock.blockPicker*control.rotation], (currentBlock.currentBlockX*50)+350, ghosty);
      tint(255, 255);
      ghosty = 940;*/
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
    //text(point[uwu]*50, spriteX[uwu], spriteY[uwu]+50);
      _new = false;
      // in dit gedeelte wordt een sprite gelinkt aan een onderdeel van de sprite arrays om er voor te zorgen dat de sprites blijven zodra een blok geplaatst is.
      if((currentBlock.blockPicker != 3) && (currentBlock.blockPicker != 8)){
        point[uwu] = 4;
      }
      if(currentBlock.blockPicker == 3){
        point[uwu] = 1;
      }
      if(currentBlock.blockPicker == 8){
        point[uwu] = 3;
      }
      //for(int the; the < win; the++){}
      // dit komende blok code staat twaalf keer in de code. een keer voor iedere rotatie van de sprites, en een keer voor iedere moeilijkheids graad.
      //er zijn 4 verschillende orientaties die een blok kan hebben, en er zijn drie verschillende moeilijkheden.
      if(home.e || home.t){ // easy difficulty
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
      }
      if(home.balanced){ //balanced difficulty
       if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ZeroX; spriteY[uwu] = tBlock.ZeroY; spritewah[uwu] = 8+24; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+24; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+24; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ZeroX; spriteY[uwu] = sBlock.ZeroY; spritewah[uwu] = 6+24; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ZeroX; spriteY[uwu] = zBlock.ZeroY; spritewah[uwu] = 7+24; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ZeroX; spriteY[uwu] = jBlock.ZeroY; spritewah[uwu] = 2+24; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ZeroX; spriteY[uwu] = lBlock.ZeroY; spritewah[uwu] = 3+24; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ZeroX; spriteY[uwu] = commaBlock.ZeroY; spritewah[uwu] = 0+24; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1+24; uwu+=1;}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.OneX; spriteY[uwu] = tBlock.OneY; spritewah[uwu] = 15+24; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+24; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+24; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.OneX; spriteY[uwu] = sBlock.OneY; spritewah[uwu] = 13+24; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.OneX; spriteY[uwu] = zBlock.OneY; spritewah[uwu] = 14+24; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.OneX; spriteY[uwu] = jBlock.OneY; spritewah[uwu] = 11+24; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.OneX; spriteY[uwu] = lBlock.OneY; spritewah[uwu] = 12+24; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.OneX; spriteY[uwu] = commaBlock.OneY; spritewah[uwu] = 9+24; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10+24; uwu+=1;}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.TwoX; spriteY[uwu] = tBlock.TwoY; spritewah[uwu] = 19+24; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+24; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+24; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.TwoX; spriteY[uwu] = sBlock.TwoY; spritewah[uwu] = 6+24; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.TwoX; spriteY[uwu] = zBlock.TwoY; spritewah[uwu] = 7+24; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.TwoX; spriteY[uwu] = jBlock.TwoY; spritewah[uwu] = 17+24; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.TwoX; spriteY[uwu] = lBlock.TwoY; spritewah[uwu] = 18+24; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.TwoX; spriteY[uwu] = commaBlock.TwoY; spritewah[uwu] = 16+24; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1+24; uwu+=1;}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ThreeX; spriteY[uwu] = tBlock.ThreeY; spritewah[uwu] = 23+24; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+24; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+24; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ThreeX; spriteY[uwu] = sBlock.ThreeY; spritewah[uwu] = 13+24; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ThreeX; spriteY[uwu] = zBlock.ThreeY; spritewah[uwu] = 14+24; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ThreeX; spriteY[uwu] = jBlock.ThreeY; spritewah[uwu] = 21+24; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ThreeX; spriteY[uwu] = lBlock.ThreeY; spritewah[uwu] = 22+24; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ThreeX; spriteY[uwu] = commaBlock.ThreeY; spritewah[uwu] = 20+24; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10+24; uwu+=1;}
      } 
        
      }
      if(home.h){ // 'insane' difficulty
      //rotatie 1
      if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ZeroX; spriteY[uwu] = tBlock.ZeroY; spritewah[uwu] = 8+48; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+48; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+48; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ZeroX; spriteY[uwu] = sBlock.ZeroY; spritewah[uwu] = 6+48; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ZeroX; spriteY[uwu] = zBlock.ZeroY; spritewah[uwu] = 7+48; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ZeroX; spriteY[uwu] = jBlock.ZeroY; spritewah[uwu] = 2+48; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ZeroX; spriteY[uwu] = lBlock.ZeroY; spritewah[uwu] = 3+48; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ZeroX; spriteY[uwu] = commaBlock.ZeroY; spritewah[uwu] = 0+48; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1+48; uwu+=1;}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.OneX; spriteY[uwu] = tBlock.OneY; spritewah[uwu] = 15+48; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+48; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+48; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.OneX; spriteY[uwu] = sBlock.OneY; spritewah[uwu] = 13+48; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.OneX; spriteY[uwu] = zBlock.OneY; spritewah[uwu] = 14+48; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.OneX; spriteY[uwu] = jBlock.OneY; spritewah[uwu] = 11+48; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.OneX; spriteY[uwu] = lBlock.OneY; spritewah[uwu] = 12+48; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.OneX; spriteY[uwu] = commaBlock.OneY; spritewah[uwu] = 9+48; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10+48; uwu+=1;}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.TwoX; spriteY[uwu] = tBlock.TwoY; spritewah[uwu] = 19+48; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+48; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+48; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.TwoX; spriteY[uwu] = sBlock.TwoY; spritewah[uwu] = 6+48; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.TwoX; spriteY[uwu] = zBlock.TwoY; spritewah[uwu] = 7+48; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.TwoX; spriteY[uwu] = jBlock.TwoY; spritewah[uwu] = 17+48; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.TwoX; spriteY[uwu] = lBlock.TwoY; spritewah[uwu] = 18+48; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.TwoX; spriteY[uwu] = commaBlock.TwoY; spritewah[uwu] = 16+48; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.ZeroTwoX; spriteY[uwu] = iBlock.ZeroTwoY; spritewah[uwu] = 1+48; uwu+=1;}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) { spriteX[uwu] = tBlock.ThreeX; spriteY[uwu] = tBlock.ThreeY; spritewah[uwu] = 23+48; uwu+=1;}
        if (currentBlock.blockPicker == 2) { spriteX[uwu] = oBlock.ZeroX; spriteY[uwu] = oBlock.ZeroY; spritewah[uwu] = 4+48; uwu+=1;}
        if (currentBlock.blockPicker == 3) { spriteX[uwu] = pointBlock.ZeroX; spriteY[uwu] = pointBlock.ZeroY; spritewah[uwu] = 5+48; uwu+=1;}
        if (currentBlock.blockPicker == 4) { spriteX[uwu] = sBlock.ThreeX; spriteY[uwu] = sBlock.ThreeY; spritewah[uwu] = 13+48; uwu+=1;}
        if (currentBlock.blockPicker == 5) { spriteX[uwu] = zBlock.ThreeX; spriteY[uwu] = zBlock.ThreeY; spritewah[uwu] = 14+48; uwu+=1;}
        if (currentBlock.blockPicker == 6) { spriteX[uwu] = jBlock.ThreeX; spriteY[uwu] = jBlock.ThreeY; spritewah[uwu] = 21+48; uwu+=1;}
        if (currentBlock.blockPicker == 7) { spriteX[uwu] = lBlock.ThreeX; spriteY[uwu] = lBlock.ThreeY; spritewah[uwu] = 22+48; uwu+=1;}
        if (currentBlock.blockPicker == 8) { spriteX[uwu] = commaBlock.ThreeX; spriteY[uwu] = commaBlock.ThreeY; spritewah[uwu] = 20+48; uwu+=1;}
        if (currentBlock.blockPicker == 9) { spriteX[uwu] = iBlock.OneThreeX; spriteY[uwu] = iBlock.OneThreeY; spritewah[uwu] = 10+48; uwu+=1;}
      }
      }
      /*for (int a = 0; a <uwu; a++) {
        fill(255);
      text(point[a]*50, spriteX[a], spriteY[a]+50 );
      }*/
      b=15;
      currentBlock.newBlock = true;
      check = false;
      downCount = 0;
    }
  }

  void filledClear() { //dit stuk code kan worden gebruikt om het veld leeg te halen, de sprites worden hier niet geregeld.
    for (int i = 0; i<grid.w; i++) {
      for (int b = 0; b<grid.h; b++) {
        filled[i][b] = 0;
      }
    }
  }
  
  //dit stuk is voor een kleine animatie die plaats vind als je een blok plaatst. het laat zien hoeveel punten je hebt gekregen voor dat blok.
  void pointAnim (){
    if((b < 81) && (b > 18.4)&&(uwu>=1)){
 //text(/*point[uwu]*50*/"Test", spriteX[uwu], spriteY[uwu]+50);
   textSize( 100-(pow((50-b), 2))/10);
   //fill(0);
   text(point[uwu-1]*50, spriteX[uwu-1]+25, spriteY[uwu-1]);
   //fill(0,255,0);
    }
 b+=3;
}
void spawnAnim (){//voor spawn particle effect (niet te verwarren met 'spawning some particle effects')
  if (land){
   for(int i = 0; i< roundCount; i++){ //hier worden de beginwaardes voor de particles bepaalt.
   roundX[i]=0;
   roundY[i]=0;
      roundSize[i] = random(10,50);
      rotate[i] = int(random(360));
      //println(roundSize[i]);
      //rotate(random(360));
    } 
  }
    for(int i = 0; i< roundCount; i++){ //in dit gedeelte vind het daadwerkelijke maken en bewegen van de particles plaats
      noStroke();
      pushMatrix();
      color c = color(255, 200-(roundX[i]*3)); //hier wordt de transparantie aangepast
      fill(c);
      translate(width/2.1, 150);
      rotate(radians(rotate[i]));
      //translate();
      rect(roundX[i], roundY[i], roundSize[i], roundSize[i]);
      roundX[i] +=3;
      roundY[i] +=3;
      //println(roundSize[i]); 
      popMatrix();
  }
}

void ghost (){ //hier wordt de zogenaamde 'ghostblock' gemaakt. het laat zien waar het blok heen zal gaan als je het alleen nog zou laten vallen.
  tint(255,random(70, 110));
  // hier wordt dezelfde code als bij de collision detection gebruikt. het voornaamste verschil zit hem in de toevoeging van de 'downCount' variabele.
  // deze variable laat het transarante blok in een keer naar beneden vallen. de rest zorgt er voor dat het stop met vallen.
  // als er geen collision is, wordt 'downCount' met een verhoogt, en dus valt het transparante blok een extra naar beneden.
  // 'downCount wordt weer naar 0 gebracht als het bestuurde blok wordt gedraait of opzij wordt geschoven.
  if (currentBlock.blockPicker == 1) {// t-block
      if ((tBlock.maxY+downCount >= grid.h-1) ||
        ((grid.cells[tBlock.mainBlockX][tBlock.maxY+1+downCount] == 1) ||
        ((grid.cells[tBlock.minX][tBlock.mainBlockY+1+downCount] == 1) && (tBlock.minX != tBlock.mainBlockX)) ||
        ((grid.cells[tBlock.maxX][tBlock.mainBlockY+1+downCount] == 1) && (tBlock.maxX != tBlock.mainBlockX)) ) ) {
          //stop movement
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 2) {// o-block
      if ((oBlock.maxY+downCount >= grid.h-1) || (grid.cells[oBlock.width2][oBlock.maxY+1+downCount] == 1) || (grid.cells[oBlock.width3][oBlock.maxY+1+downCount] == 1) ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 3) {// point-block
      //println(pointBlock.mainBlockY);
      if ((pointBlock.mainBlockY+downCount >= grid.h-1) || (grid.cells[pointBlock.mainBlockX][pointBlock.mainBlockY+1+downCount] == 1)/**/) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 4) {// s-block
      if ((sBlock.maxY+downCount >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[sBlock.maxX][sBlock.maxY+1+downCount] == 1) || (grid.cells[sBlock.minX][sBlock.maxY+downCount]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[sBlock.minX][sBlock.maxY+1+downCount] == 1) || (grid.cells[sBlock.mainBlockX][sBlock.maxY+1+downCount]==1)|| (grid.cells[sBlock.maxX][sBlock.maxY+downCount]==1)))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 5) {// z-block
      if ((zBlock.maxY+downCount >= grid.h-1) || ((control.rotation == 3 || control.rotation == 1) && ((grid.cells[zBlock.minX][zBlock.maxY+1] == 1) || (grid.cells[zBlock.maxX][zBlock.maxY+downCount]==1))) ||
        ((control.rotation == 0 || control.rotation == 2) && ((grid.cells[zBlock.maxX][zBlock.maxY+1+downCount] == 1) || (grid.cells[zBlock.mainBlockX][zBlock.maxY+1+downCount]==1)|| (grid.cells[zBlock.minX][zBlock.maxY+downCount]==1)))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 6) {// j-block
      if ((jBlock.maxY+downCount >= grid.h-1)||
        ((control.rotation == 0) && ((grid.cells[jBlock.minX][jBlock.maxY+1+downCount] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1+downCount]==1)))||
        ((control.rotation == 1) && ((grid.cells[jBlock.minX][jBlock.maxY+1+downCount] == 1) || (grid.cells[jBlock.mainBlockX][jBlock.maxY+1+downCount] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1] == 1)))||
        ((control.rotation == 2) && ((grid.cells[jBlock.minX][jBlock.maxY+1+downCount] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY-1+downCount] == 1)))||
        ((control.rotation == 3) && ((grid.cells[jBlock.minX][jBlock.maxY+downCount] == 1) || (grid.cells[jBlock.mainBlockX][jBlock.maxY+downCount] == 1) || (grid.cells[jBlock.maxX][jBlock.maxY+1] == 1)))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 7) {// l-block
      if ((lBlock.maxY+downCount >= grid.h-1)||
        ((control.rotation == 0) && ((grid.cells[lBlock.minX][lBlock.maxY+1+downCount] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1+downCount]==1)))||
        ((control.rotation == 3) && ((grid.cells[lBlock.minX][lBlock.maxY+1+downCount] == 1) || (grid.cells[lBlock.mainBlockX][lBlock.maxY+1+downCount] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1] == 1)))||
        ((control.rotation == 2) && ((grid.cells[lBlock.minX][lBlock.maxY-1+downCount] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY+1+downCount] == 1)))||
        ((control.rotation == 1) && ((grid.cells[lBlock.minX][lBlock.maxY+1+downCount] == 1) || (grid.cells[lBlock.mainBlockX][lBlock.maxY+downCount] == 1) || (grid.cells[lBlock.maxX][lBlock.maxY] == 1)))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 8) {// comma-block
      if ((commaBlock.maxY+downCount >= grid.h-1)||
        (grid.cells[commaBlock.mainBlockX][commaBlock.maxY+1+downCount] == 1)||
        ((grid.cells[commaBlock.minX][commaBlock.mainBlockY+1+downCount] == 1) && (commaBlock.minX != commaBlock.mainBlockX ))||
        ((grid.cells[commaBlock.maxX][commaBlock.mainBlockY+1+downCount] == 1) && (commaBlock.maxX != commaBlock.mainBlockX))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
    if (currentBlock.blockPicker == 9) {// i-block
      if ((iBlock.maxY+downCount >= grid.h-1)||
        ((control.rotation == 0 || control.rotation == 2) && (grid.cells[iBlock.minX][iBlock.maxY+1+downCount] == 1))||
        ((control.rotation == 1 || control.rotation == 3) && ((grid.cells[iBlock.block1X][iBlock.block1Y+1+downCount] == 1) || (grid.cells[iBlock.mainBlockX][iBlock.mainBlockY+1+downCount] == 1) || (grid.cells[iBlock.block3X][iBlock.block3Y+1+downCount] == 1) || (grid.cells[iBlock.block4X][iBlock.block4Y+1+downCount] == 1)))
        ) {
      }
      else{
       downCount+=1; 
      }
    }
  bott = ((downCount-1)*50); //dit is de formule voor de extra afstand die de ghostblock moet afleggen.
  // hier wordt een stuk code voor het bepalen van de moeilijkheid en oriantatie gebruikt, maar dan met als resultaat dat een andere afbeelding wordt geladen voor de ghostblock.
  if (home.e ||  home.t){ //easy
  if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) {image(spriteN[8], tBlock.ZeroX, tBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6], sBlock.ZeroX, sBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7], zBlock.ZeroX, zBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[2], jBlock.ZeroX, jBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[3], lBlock.ZeroX, lBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[0], commaBlock.ZeroX, commaBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) {image(spriteN[15], tBlock.OneX, tBlock.OneY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4], oBlock.ZeroX,Y+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13], sBlock.OneX, sBlock.OneY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14], zBlock.OneX, zBlock.OneY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[11], jBlock.OneX, jBlock.OneY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[12], lBlock.OneX, lBlock.OneY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[9], commaBlock.OneX, commaBlock.OneY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) {image(spriteN[19], tBlock.TwoX, tBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6], sBlock.TwoX, sBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7], zBlock.TwoX, zBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[17], jBlock.TwoX, jBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[18], lBlock.TwoX, lBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[16], commaBlock.TwoX, commaBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) {image(spriteN[23], tBlock.ThreeX, tBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13], sBlock.ThreeX, sBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14], zBlock.ThreeX, zBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[21], jBlock.ThreeX, jBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[22], lBlock.ThreeX, lBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[20], commaBlock.ThreeX, commaBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
  }
  if (home.balanced){ //balanced
  if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) {image(spriteN[8+24], tBlock.ZeroX, tBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+24], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+24], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6+24], sBlock.ZeroX, sBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7+24], zBlock.ZeroX, zBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[2+24], jBlock.ZeroX, jBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[3+24], lBlock.ZeroX, lBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[0+24], commaBlock.ZeroX, commaBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1+24], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) {image(spriteN[15+24], tBlock.OneX, tBlock.OneY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+24], oBlock.ZeroX,Y+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+24], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13+24], sBlock.OneX, sBlock.OneY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14+24], zBlock.OneX, zBlock.OneY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[11+24], jBlock.OneX, jBlock.OneY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[12+24], lBlock.OneX, lBlock.OneY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[9+24], commaBlock.OneX, commaBlock.OneY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10+24], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) {image(spriteN[19+24], tBlock.TwoX, tBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+24], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+24], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6+24], sBlock.TwoX, sBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7+24], zBlock.TwoX, zBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[17+24], jBlock.TwoX, jBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[18+24], lBlock.TwoX, lBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[16+24], commaBlock.TwoX, commaBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1+24], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) {image(spriteN[23+24], tBlock.ThreeX, tBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+24], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+24], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13+24], sBlock.ThreeX, sBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14+24], zBlock.ThreeX, zBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[21+24], jBlock.ThreeX, jBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[22+24], lBlock.ThreeX, lBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[20+24], commaBlock.ThreeX, commaBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10+24], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
  }
  if (home.h){ // 'insane'
  if (control.rotation == 0) {
        if (currentBlock.blockPicker == 1) {image(spriteN[8+48], tBlock.ZeroX, tBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+48], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+48], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6+48], sBlock.ZeroX, sBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7+48], zBlock.ZeroX, zBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[2+48], jBlock.ZeroX, jBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[3+48], lBlock.ZeroX, lBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[0+48], commaBlock.ZeroX, commaBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1+48], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // orientatie 2
      if (control.rotation == 1) {
        if (currentBlock.blockPicker == 1) {image(spriteN[15+48], tBlock.OneX, tBlock.OneY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+48], oBlock.ZeroX,Y+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+48], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13+48], sBlock.OneX, sBlock.OneY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14+48], zBlock.OneX, zBlock.OneY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[11+48], jBlock.OneX, jBlock.OneY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[12+48], lBlock.OneX, lBlock.OneY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[9+48], commaBlock.OneX, commaBlock.OneY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10+48], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
      
      // draai 3
      if (control.rotation == 2) {
        if (currentBlock.blockPicker == 1) {image(spriteN[19+48], tBlock.TwoX, tBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+48], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+48], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[6+48], sBlock.TwoX, sBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[7+48], zBlock.TwoX, zBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[17+48], jBlock.TwoX, jBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[18+48], lBlock.TwoX, lBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[16+48], commaBlock.TwoX, commaBlock.TwoY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[1+48], iBlock.ZeroTwoX, iBlock.ZeroTwoY+bott);}
      }
      
      // twist 4
      if (control.rotation == 3) {
        if (currentBlock.blockPicker == 1) {image(spriteN[23+48], tBlock.ThreeX, tBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 2) {image(spriteN[4+48], oBlock.ZeroX, oBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 3) {image(spriteN[5+48], pointBlock.ZeroX, pointBlock.ZeroY+bott);}
        if (currentBlock.blockPicker == 4) {image(spriteN[13+48], sBlock.ThreeX, sBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 5) {image(spriteN[14+48], zBlock.ThreeX, zBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 6) {image(spriteN[21+48], jBlock.ThreeX, jBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 7) {image(spriteN[22+48], lBlock.ThreeX, lBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 8) {image(spriteN[20+48], commaBlock.ThreeX, commaBlock.ThreeY+bott);}
        if (currentBlock.blockPicker == 9) {image(spriteN[10+48], iBlock.OneThreeX, iBlock.OneThreeY+bott);}
      }
  }
  tint(255,255);
}


}
