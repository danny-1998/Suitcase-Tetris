class Lblock {
  /*diagram of how im coding this L_Block in the grid:
   *                [1]
   *                [0]
   *                [2][3]
   *               0 = main
   */
  
  int mainBlockX;
  int mainBlockY;
  int block1X, block1Y;
  int block2X, block2Y;
  int block3X, block3Y;
  int minX, maxX;
  boolean onEdgeLeft, onEdgeRight;
  
  Lblock(){
    mainBlockX = 5;
    mainBlockY = 5;
  }
  
 void LblockDraw () {
   mainBlockX = currentBlock.currentBlockX;
   mainBlockY = currentBlock.currentBlockY;
   
   if (control.rotation == 0) {
     block1X = mainBlockX;
     block1Y = mainBlockY - 1;
                                         //    [1]
     block2X = mainBlockX;               //    [0]       
     block2Y = mainBlockY + 1;           //    [2][3]
     
     block3X = mainBlockX + 1;
     block3Y = mainBlockY + 1;
     
     minX = mainBlockX;
     maxX = mainBlockX+1;
     
   }
   
   if (control.rotation == 1) {
     block1X = mainBlockX + 1;
     block1Y = mainBlockY;
                                         //    [2][0][1]      
     block2X = mainBlockX - 1;           //    [3]                    
     block2Y = mainBlockY;                     
     
     block3X = mainBlockX - 1;
     block3Y = mainBlockY + 1;
     
     minX = mainBlockX-1;
     maxX = mainBlockX+1;
   }
   
   if (control.rotation == 2) {
     block1X = mainBlockX;
     block1Y = mainBlockY + 1;
                                         //    [3][2]
     block2X = mainBlockX;               //       [0]       
     block2Y = mainBlockY - 1;           //       [1]
     
     block3X = mainBlockX - 1;
     block3Y = mainBlockY - 1;
     
     minX = mainBlockX-1;
     maxX = mainBlockX;
   }
   
   if (control.rotation == 3) {
     block1X = mainBlockX - 1;
     block1Y = mainBlockY;
                                         //          [3]
     block2X = mainBlockX + 1;           //    [1][0][2]       
     block2Y = mainBlockY;           
     
     block3X = mainBlockX + 1;
     block3Y = mainBlockY - 1;
     
     minX = mainBlockX-1;
     maxX = mainBlockX+1;
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
    grid.cells[block1X][block1Y] = 1;
    grid.cells[block2X][block2Y] = 1;
    grid.cells[block3X][block3Y] = 1;
   
 }
 
 
 
}
