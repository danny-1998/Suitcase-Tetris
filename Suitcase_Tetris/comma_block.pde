// Nina Brochard

class CommaBlock { 

  /*diagram of how im coding this comma_Block in the grid:
   *                [0]
   *                [1][2]
   *               1 = main
   */


  int mainBlockX, mainBlockY;
  int block0X, block0Y;
  int block2X, block2Y;
  int minX, maxX;
  int maxY;
  int ZeroX = mainBlockX*50+350;
  int ZeroY = mainBlockY*50-10;
  int OneX = mainBlockX*50+300;
  int OneY = mainBlockX*50+300;
  int TwoX = mainBlockX*50+350;
  int TwoY = mainBlockY*50-10;
  int ThreeX = mainBlockY*50+40;
  int ThreeY = mainBlockY*50+40;
  boolean onEdgeLeft, onEdgeRight;
  boolean wallClockwise, wallAnticlockwise;

  CommaBlock() {
    mainBlockX = 6;
    mainBlockY = 6;
  }

  void CommaBlockDraw () {
    ZeroX = mainBlockX*50+350;
    ZeroY = mainBlockY*50-10;
    OneX = mainBlockX*50+350;
    OneY = mainBlockY*50+40;
    TwoX = mainBlockX*50+300;
    TwoY = mainBlockY*50+40;
    ThreeX = mainBlockX*50+300;
    ThreeY = mainBlockY*50-10;
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    if (control.rotation == 0) {
      block0X = mainBlockX;                  // the block looks like this:
      block0Y = mainBlockY - 1;              //        [0]
      //        [M][2]              
      block2X = mainBlockX + 1;
      block2Y = mainBlockY;

      minX = mainBlockX;
      maxX = mainBlockX+1;
      maxY = mainBlockY;

      wallClockwise = false;
      wallAnticlockwise = true;
    }

    if (control.rotation == 1) {
      block0X = mainBlockX + 1;              // the block looks like this:
      block0Y = mainBlockY;                  //        [M][0]
      //        [2]
      block2X = mainBlockX;
      block2Y = mainBlockY + 1;

      minX = mainBlockX;
      maxX = mainBlockX+1;
      maxY = mainBlockY + 1;

      wallClockwise = true;
      wallAnticlockwise = false;
    }

    if (control.rotation == 2) {
      block0X = mainBlockX;                  // the block looks like this:
      block0Y = mainBlockY + 1;              //     [2][M]
      //        [0]
      block2X = mainBlockX - 1;
      block2Y = mainBlockY;

      minX = mainBlockX-1;
      maxX = mainBlockX;
      maxY = mainBlockY + 1;

      wallClockwise = false;
      wallAnticlockwise = true;
    }

    if (control.rotation == 3) {
      block0X = mainBlockX - 1;              // the block looks like this
      block0Y = mainBlockY;                  //            [2] 
      //         [0][M]
      block2X = mainBlockX;
      block2Y = mainBlockY - 1;

      minX = mainBlockX-1;
      maxX = mainBlockX;
      maxY = mainBlockY;

      wallClockwise = true;
      wallAnticlockwise = false;
    }


    if (mainBlockX == 0) {            
      onEdgeLeft = true;
    } else {
      onEdgeLeft = false;            // makes sure the block doesn't go off the grid
    }

    if (mainBlockX == grid.w-1) {   
      onEdgeRight = true;
    } else {
      onEdgeRight = false;
    }


      if (control.rotation == 0) {                // all of the following code is for rotating the block
      image(spriteN[0], ZeroX, ZeroY);

        //easy
        if (home.easy == true || home.tutorial == true) {
        if (control.rotation == 0) {                // all of the following code is for rotating the block
          image(spriteN[0], ZeroX, ZeroY);

            if (mainBlockX > 0) { 
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[9], OneX, OneY);
          if (mainBlockX > 0) {
            if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[16], TwoX, TwoY);
          if (mainBlockX > 1) {
            if (grid.cells[block2X-1][block2Y] > 0 || grid.cells[block0X-1][block0Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[20], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block2X+1][block2Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }
      //balanced
      if (home.balanced == true) {
        if (control.rotation == 0) {                // all of the following code is for rotating the block
          image(spriteN[0+24], ZeroX, ZeroY);
          if (mainBlockX > 0) { 
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[9+24], OneX, OneY);
          if (mainBlockX > 0) {
            if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[16+24], TwoX, TwoY);
          if (mainBlockX > 1) {
            if (grid.cells[block2X-1][block2Y] > 0 || grid.cells[block0X-1][block0Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[20+24], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block2X+1][block2Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }
      //insane
      if (home.insane == true) {
        if (control.rotation == 0) {                // all of the following code is for rotating the block
          image(spriteN[0+48], ZeroX, ZeroY);
          if (mainBlockX > 0) { 
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 1) {
          image(spriteN[9+48], OneX, OneY);
          if (mainBlockX > 0) {
            if (grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 2) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block2X+1][block2Y] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 2) {
          image(spriteN[16+48], TwoX, TwoY);
          if (mainBlockX > 1) {
            if (grid.cells[block2X-1][block2Y] > 0 || grid.cells[block0X-1][block0Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }

        if (control.rotation == 3) {
          image(spriteN[20+48], ThreeX, ThreeY);
          if (mainBlockX > 1) {
            if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block2X-1][block2Y] > 0) {
              control.blockLeft = true;
            } else {
              control.blockLeft = false;
            }
          }
          if (mainBlockX < grid.w - 1) {
            if (grid.cells[block2X+1][block2Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
              control.blockRight = true;
            } else {
              control.blockRight = false;
            }
          }
        }
      }

      grid.cells[mainBlockX][mainBlockY] = 1;
      grid.cells[block0X][block0Y] = 1;                  // places the block on the grid
      grid.cells[block2X][block2Y] = 1;

      ZeroX = mainBlockX*50+350;
      ZeroY = mainBlockY*50-10;
      OneX = mainBlockX*50+350;
      OneY = mainBlockY*50+40;
      TwoX = mainBlockX*50+300;
      TwoY = mainBlockY*50+40;
      ThreeX = mainBlockX*50+300;
      ThreeY = mainBlockY*50-10;
    }
  }
}
