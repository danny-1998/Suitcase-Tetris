// By Kiano Wortel

class JBlock {
  /*diagram of how im coding this J_Block in the grid:
   *                   [1]
   *                   [0]
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



  void JBlockDraw() {

    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0) {              //   [1]
      width1=mainBlockX;                      //   [0]
      height1=mainBlockY-1;                   //[2][3]

      width2= mainBlockX-1;
      height2 = mainBlockY+1;

      width3= mainBlockX;
      height3=mainBlockY+1;

      grid.cells[currentBlock.currentBlockX][currentBlock.currentBlockY-1] = 1;
      grid.cells[currentBlock.currentBlockX][currentBlock.currentBlockY] = 1;
      grid.cells[currentBlock.currentBlockX][currentBlock.currentBlockY+1] = 1;
      grid.cells[currentBlock.currentBlockX-1][currentBlock.currentBlockY+1] = 1;
      if (currentBlock.currentBlockX == 21) {
        image(spriteN[2], currentBlock.currentBlockX*50+300, currentBlock.currentBlockY*50-10);
        ZeroX = currentBlock.currentBlockX*50+300;
        ZeroY = currentBlock.currentBlockY*50-10;
      }
      minX = mainBlockX-1;
      maxX = mainBlockX;
      maxY = mainBlockY + 1;

      wallClockwise = true;
      wallAnticlockwise = true;
    } else 

    if (control.rotation == 1) {          //   [2]
      width1 = mainBlockX+1;              //   [3][0][1]
      height1 = mainBlockY;           

      width2 = mainBlockX-1;
      height2 = mainBlockY-1;

      width3 = mainBlockX-1;
      height3 = mainBlockY;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY;

      wallClockwise = false;
      wallAnticlockwise = false;
    } else
      if (control.rotation == 2) {           //      [3][2]
        width1=mainBlockX;                   //      [0]
        height1=mainBlockY+1;                //      [1]

        width2= mainBlockX+1;
        height2 = mainBlockY-1;

        width3= mainBlockX;
        height3=mainBlockY-1;

        minX = mainBlockX;
        maxX = mainBlockX+1;
        maxY = mainBlockY + 1;

        wallClockwise = true ;
        wallAnticlockwise = true;
      } else
        if (control.rotation == 3) {
          width1 = mainBlockX-1;              //     [1][0][3]
          height1 = mainBlockY;               //           [2]

          width2 = mainBlockX+1;
          height2 = mainBlockY+1;

          width3 = mainBlockX+1;
          height3 = mainBlockY;

          minX = mainBlockX-1;
          maxX = mainBlockX+1;
          maxY = mainBlockY + 1;

          wallClockwise = false ;
          wallAnticlockwise = false;
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
      if (home.e == true) {
        if (control.rotation == 0) {
          image(spriteN[2], ZeroX, ZeroY);
          if (mainBlockX > 1) { 
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[width1+1][height1] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 ||  grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[11], OneX, OneY);
          if (mainBlockX > 1) {
            if (grid.cells[width2-1][height2] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[17], TwoX, TwoY);
          if (mainBlockX > 0) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[21], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }
      //difficulty = balanced
      if (home.m == true) {
        if (control.rotation == 0) {
          image(spriteN[2+24], ZeroX, ZeroY);
          if (mainBlockX > 1) { 
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[width1+1][height1] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 ||  grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[11+24], OneX, OneY);
          if (mainBlockX > 1) {
            if (grid.cells[width2-1][height2] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[17+24], TwoX, TwoY);
          if (mainBlockX > 0) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[21+24], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }
      //insane
      if (home.h == true) {
        if (control.rotation == 0) {
          image(spriteN[2+48], ZeroX, ZeroY);
          if (mainBlockX > 1) { 
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[width1+1][height1] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 ||  grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[11+48], OneX, OneY);
          if (mainBlockX > 1) {
            if (grid.cells[width2-1][height2] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[17+48], TwoX, TwoY);
          if (mainBlockX > 0) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[width3-1][height3] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0 || grid.cells[width1+1][height1] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[21+48], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[width1-1][height1] > 0 || grid.cells[width2-1][height2] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[width2+1][height2] > 0 || grid.cells[width3+1][height3] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }

      ZeroX = mainBlockX*50+300;
      ZeroY = mainBlockY*50-10;
      OneX = mainBlockX*50+300;
      OneY = mainBlockY*50-10;
      TwoX = mainBlockX*50+350;
      TwoY = mainBlockY*50-10;
      ThreeX = mainBlockX*50+300;
      ThreeY = mainBlockY*50+40;

      grid.cells[mainBlockX][mainBlockY] = 1;
      grid.cells[width1][height1] = 1;
      grid.cells[width2][height2] = 1;
      grid.cells[width3][height3] = 1;
    }
  }
}
