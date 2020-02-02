class TBlock { //<>// //<>// //<>// //<>//
  /* By Ole Neuman
   *diagram of how im coding this T_Block in the grid:
   *                [0]
   *             [1][M][3]
   * Where block M is my mainBlock, and the coördinates of the other blocks depend on the coördinate of the main block
   */
  int mainBlockX, mainBlockY;   //the sets of coördinates for each cube of the T_Block
  int block0X, block0Y;
  int block1X, block1Y;
  int block3X, block3Y;
  int ZeroX, ZeroY;
  int OneX, OneY;
  int TwoX, TwoY;
  int ThreeX, ThreeY;

  boolean onEdgeLeft, onEdgeRight;            //if the piece is next to the wall, and has a possibility of rotating outside of the array, the boolean is true
  boolean wallClockwise, wallAnticlockwise;   //if you would rotate the piece clockwise or anticlockwise, and it would end up outside of the array, the boolean is true. This is used in the controlls to make sure that doesnt happen
  int minX, maxX;                             //the minimum and maximum X value the block can have before going outside of the array, and thus crashing the program 
  int maxY;                                   //the maximum Y value the block can have before going outside of the array via the bottom
  

  void TBlockDraw() {
    mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;
    
    
    if (control.rotation == 0) {            //      [0]      a visual representation of how the code defines the blocks in relation to eachother
      block0X = mainBlockX;                 //   [1][M][3]
      block0Y = mainBlockY-1;

      block1X = mainBlockX-1;
      block1Y = mainBlockY;

      block3X = mainBlockX+1;
      block3Y = mainBlockY;

      minX = mainBlockX-1;
      maxX = mainBlockX+1;
      maxY = mainBlockY;

      wallClockwise = false;
      wallAnticlockwise = false;
    } else 
    if (control.rotation == 1) {           //     [1]
      block0X = mainBlockX+1;              //     [M][0]
      block0Y = mainBlockY;                //     [3]

      block1X = mainBlockX;
      block1Y = mainBlockY-1;

      block3X = mainBlockX;
      block3Y = mainBlockY+1;

      minX = mainBlockX;
      maxX = mainBlockX+1;
      maxY = mainBlockY+1;

      wallClockwise = true;
      wallAnticlockwise = true;
    } else
      if (control.rotation == 2) {        //   [3][M][1]
        block0X = mainBlockX;             //      [0]
        block0Y = mainBlockY+1;

        block1X = mainBlockX+1;
        block1Y = mainBlockY;

        block3X = mainBlockX-1;
        block3Y = mainBlockY;

        minX = mainBlockX-1;
        maxX = mainBlockX+1;
        maxY = mainBlockY+1;

        wallClockwise = false;
        wallAnticlockwise = false;
      } else
        if (control.rotation == 3) {      //      [3]
          block0X = mainBlockX-1;         //   [0][M]
          block0Y = mainBlockY;           //      [1]

          block1X = mainBlockX;
          block1Y = mainBlockY+1;

          block3X = mainBlockX;
          block3Y = mainBlockY-1;

          minX = mainBlockX-1;
          maxX = mainBlockX;
          maxY = mainBlockY+1;

          wallClockwise = true;
          wallAnticlockwise = true;
        }                             //                                    |[1]
    if (mainBlockX == 0) {            //if the piece is up to the wall like |[M][0]      the boolean is true
      onEdgeLeft = true;              //                                    |[3]   
    } else {
      onEdgeLeft = false;
    }
                                     //                                       [3]|
    if (mainBlockX == grid.w-1) {    //if the piece is up to the wall like [0][M]|       the boolean is true
      onEdgeRight = true;            //                                       [1]|
    } else {
      onEdgeRight = false;
    }

  //easy
  if (home.easy == true || home.tutorial == true) {
    if (control.rotation == 0) {                          //the collision calculations, which check if there is a block to the left or right of any of the T-Block pieces
      image(spriteN[8], ZeroX, ZeroY);                    //based on the rotation of the piece, a different sprite gets called, which corresponds to the oriëntation the piece has
      if (mainBlockX > 1) {                               //the calculations are only active if there is 1 square of room between the block and both walls, because otherwise they cause a ArrayOutOfBoundsException
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0) {      //the first part of the calculations checks for blocks on the left side, and activates the blockLeft
          control.blockLeft = true;                                                          //boolean if there is, which stops the block from moving more to the left
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 3) {                                                         //the second part of the calculation checks for blocks on the right side, and activates the blockRight 
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {      //array if there is, preventing the block from moving any more to the right
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {                                                             //same thing as in the block above here, except for a different rotation
      image(spriteN[15], OneX, OneY);
      if (mainBlockX > 0) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      image(spriteN[19], TwoX, TwoY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      image(spriteN[23], ThreeX, ThreeY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }
  }
//balanced
  if (home.balanced == true) {
    if (control.rotation == 0) {                          //the collision calculations, which check if there is a block to the left or right of any of the T-Block pieces
      image(spriteN[8+24], ZeroX, ZeroY);                    //based on the rotation of the piece, a different sprite gets called, which corresponds to the oriëntation the piece has
      if (mainBlockX > 1) {                               //the calculations are only active if there is 1 square of room between the block and both walls, because otherwise they cause a ArrayOutOfBoundsException
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0) {      //the first part of the calculations checks for blocks on the left side, and activates the blockLeft
          control.blockLeft = true;                                                          //boolean if there is, which stops the block from moving more to the left
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 3) {                                                         //the second part of the calculation checks for blocks on the right side, and activates the blockRight 
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {      //array if there is, preventing the block from moving any more to the right
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {                                                             //same thing as in the block above here, except for a different rotation
      image(spriteN[15+24], OneX, OneY);
      if (mainBlockX > 0) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      image(spriteN[19+24], TwoX, TwoY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      image(spriteN[23+24], ThreeX, ThreeY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }
  }
  //insane
    if (home.insane == true) {
    if (control.rotation == 0) {                          //the collision calculations, which check if there is a block to the left or right of any of the T-Block pieces
      image(spriteN[8+48], ZeroX, ZeroY);                    //based on the rotation of the piece, a different sprite gets called, which corresponds to the oriëntation the piece has
      if (mainBlockX > 1) {                               //the calculations are only active if there is 1 square of room between the block and both walls, because otherwise they cause a ArrayOutOfBoundsException
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0) {      //the first part of the calculations checks for blocks on the left side, and activates the blockLeft
          control.blockLeft = true;                                                          //boolean if there is, which stops the block from moving more to the left
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 3) {                                                         //the second part of the calculation checks for blocks on the right side, and activates the blockRight 
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {      //array if there is, preventing the block from moving any more to the right
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 1) {                                                             //same thing as in the block above here, except for a different rotation
      image(spriteN[15+48], OneX, OneY);
      if (mainBlockX > 0) {
        if (grid.cells[block1X-1][block1Y] > 0 || grid.cells[mainBlockX-1][mainBlockY] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 2) {
      image(spriteN[19+48], TwoX, TwoY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 2) {
        if (grid.cells[block0X+1][block0Y] > 0 || grid.cells[block1X+1][block1Y] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }

    if (control.rotation == 3) {
      image(spriteN[23+48], ThreeX, ThreeY);
      if (mainBlockX > 1) {
        if (grid.cells[block0X-1][block0Y] > 0 || grid.cells[block1X-1][block1Y] > 0 || grid.cells[block3X-1][block3Y] > 0) {
          control.blockLeft = true;
        } else {
          control.blockLeft = false;
        }
      }
      if (mainBlockX < grid.w - 1) {
        if (grid.cells[block1X+1][block1Y] > 0 || grid.cells[block3X+1][block3Y] > 0 || grid.cells[mainBlockX+1][mainBlockY] > 0) {
          control.blockRight = true;
        } else {
          control.blockRight = false;
        }
      }
    }
  }


        mainBlockX = currentBlock.currentBlockX;
    mainBlockY = currentBlock.currentBlockY;

    grid.cells[mainBlockX][mainBlockY] = 1;            //here the variables, which depend on the rotation, get put into the cells[][] array, so that they actually appear on screen and in
    grid.cells[block0X][block0Y] = 1;                  //the calculations at other places
    grid.cells[block1X][block1Y] = 1;
    grid.cells[block3X][block3Y] = 1;
    
    ZeroX = mainBlockX*50+300;                  //the coördinates of the sprite image used for this block
   ZeroY = mainBlockY*50-10;                   //these are based off of the position of the block in the grid, and then translated to actual screen coördinates
   OneX = mainBlockX*50+350;
   OneY = mainBlockY*50-10;
   TwoX = mainBlockX*50+300;
   TwoY = mainBlockY*50+40;
   ThreeX = mainBlockX*50+300;
   ThreeY = mainBlockY*50-10;
  }
}
