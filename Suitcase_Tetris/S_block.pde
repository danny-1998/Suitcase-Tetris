// By Kiano Wortel

class SBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                   [0][1]
   *                [2][3]
   *               0 = main
   */

  int mainBlockX;
  int mainBlockY;
  int width1;
  int height1;
  int width2;
  int height2;
  int width3;
  int height3;
  int minX, maxX;
  int maxY;
   int ZeroX;
  int ZeroY;
  int OneX;
  int OneY;
  int TwoX;
  int TwoY;
  int ThreeX;
  int ThreeY;
  boolean onEdgeLeft, onEdgeRight;
  boolean wallClockwise, wallAnticlockwise;


  void SBlockDraw() {
 
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0) {              //   [0][1]
      width1=mainBlockX+1;                    //[2][3]
      height1=mainBlockY;

      width2= mainBlockX-1;
      height2 = mainBlockY+1;

      width3= mainBlockX;
      height3=mainBlockY+1;

      wallClockwise = false;
      wallAnticlockwise = false;
    } else 
    if (control.rotation == 1) {        //     [1]
      width1 = mainBlockX;              //     [0][3]
      height1 = mainBlockY-1;           //        [2]

      width2 = mainBlockX+1;
      height2 = mainBlockY+1;

      width3 = mainBlockX+1;
      height3 = mainBlockY;

      wallClockwise = true;
      wallAnticlockwise = true;
    } else
      if (control.rotation == 2) {           //      [0][1]
        width1=mainBlockX+1;                 //   [2][3]
        height1=mainBlockY;

        width2= mainBlockX-1;
        height2 = mainBlockY+1;

        width3= mainBlockX;
        height3=mainBlockY+1;

        wallClockwise = false;
        wallAnticlockwise = false;
      } else
        if (control.rotation == 3) {        //     [1]
          width1 = mainBlockX;              //     [0][3]
          height1 = mainBlockY-1;           //        [2]

          width2 = mainBlockX+1;
          height2 = mainBlockY+1;

          width3 = mainBlockX+1;
          height3 = mainBlockY;

          wallClockwise = true;
          wallAnticlockwise = true;
        }    

    if (control.rotation == 3 || control.rotation == 1) {
      minX = mainBlockX;
      maxX = mainBlockX+1;
    } else
      if (control.rotation == 0 || control.rotation == 2) {
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

//easy
if (home.easy == true || home.tutorial == true){
      if (control.rotation == 0) {
        image(spriteN[6], ZeroX, ZeroY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 1) {
        image(spriteN[13], OneX, OneY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 2) {
        image(spriteN[6], TwoX, TwoY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 3) {
        image(spriteN[13], ThreeX, ThreeY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }
}
//balanced
if (home.balanced == true){
if (control.rotation == 0) {
        image(spriteN[6+24], ZeroX, ZeroY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 1) {
        image(spriteN[13+24], OneX, OneY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 2) {
        image(spriteN[6+24], TwoX, TwoY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 3) {
        image(spriteN[13+24], ThreeX, ThreeY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }
//insane
if (home.insane == true){
if (control.rotation == 0) {
        image(spriteN[6+48], ZeroX, ZeroY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 1) {
        image(spriteN[13+48], OneX, OneY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 2) {
        image(spriteN[6+48], TwoX, TwoY);
        if (mainBlockX > 1) { 
          if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width2-1][height2] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

      if (control.rotation == 3) {
        image(spriteN[13+48], ThreeX, ThreeY);
        if (mainBlockX > 0) {
          if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
            control.blockLeft = true;
          } else {
            control.blockLeft = false;
          }
        }
        if (mainBlockX < grid.w - 2) {
          if (grid.cells[width1+1][height1] > 0 || grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
            control.blockRight = true;
          } else {
            control.blockRight = false;
          }
        }
      }

}
}
      grid.cells[mainBlockX][mainBlockY] = 1;
      grid.cells[width1][height1] = 1;
      grid.cells[width2][height2] = 1;
      grid.cells[width3][height3] = 1;
    }
    maxY = mainBlockY+1;
       ZeroX = mainBlockX*50+300;
   ZeroY = mainBlockY*50+40;
   OneX = mainBlockX*50+350;
   OneY = mainBlockY*50-10;
   TwoX = mainBlockX*50+300;
   TwoY = mainBlockY*50+40;
   ThreeX = mainBlockX*50+350;
   ThreeY = mainBlockY*50-10;
  }
}
