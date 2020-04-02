class Control {
  //By Ole Neuman and Jeffrey
  boolean firstPress, shiftLock, landed;
  int rotation, cooldown1, cooldown2, cooldown3, cooldownAmount;
  boolean top = false;
  public boolean blockLeft, blockRight;

  Control() {
    rotation = 0;
    firstPress = true;
    shiftLock = false;
  }

  void controllsV3() {
    if (home.easy) {              //if easy mode is selected, the cooldown of a block moving side to side is 3 frames
      cooldownAmount = 3;
    } else if (home.balanced) {       //if normal mode is selected, the cooldown of a block moving side to side is 10 frames
      cooldownAmount = 10;
    } else if (home.insane) {      //if hard mode is selected, the cooldown is 15 frames
      cooldownAmount = 15;
    } else if (home.gameState == "tutorial"){
     cooldownAmount = 3; 
    }
    if (keysPressed[65] && currentBlock.minX > 0 && cooldown1 ==  0 && !blockLeft) {      //if a is pressed, and the block is not on the left edge, and the cooldown is inactive,
      currentBlock.currentBlockX -= 1;                                                    //and there is no block to the left of the current block, it moves 1 space to the left
      blockPlace.downCount=0;
      if (firstPress) {                //if this is the initial press, the cooldown is longer, so you dont accidentally move 2 blocks when you are tapping the move button
        firstPress = false;
        cooldown1 = 25;
      } else {
        cooldown1 = cooldownAmount;    //if this is not the initial press, the cooldown is equal to the difficulty specific cooldown
      }
    }

    if (keysPressed[68] && currentBlock.maxX < grid.w-1 && cooldown1 == 0 && !blockRight) { //same as the block above, except it is checking the right side of the block
      currentBlock.currentBlockX += 1;
      blockPlace.downCount=0;
      if (firstPress) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        cooldown1 = cooldownAmount;
      }
    }

    if (keysPressed[87] && cooldown2 == 0 && currentBlock.currentBlockY < grid.h-1) { //if w is pressed, and the cooldown is inactive, and you are above the ground line, it adds 1 to the int rotation
      if (currentBlock.onEdgeLeft && currentBlock.wallClockwise) {           //if you are on the left wall, and can rotate into the wall via clockwise rotation, it adds 1 to Xpos, so the block 
        currentBlock.currentBlockX+=1;                                       //doesn't end up outside of the array
      } else
        if (currentBlock.onEdgeRight && currentBlock.wallClockwise) {        //same thing as above here, except it checks for the right side wall. if the conditions are met, it subtracts 
          currentBlock.currentBlockX-=1;                                     //1 from your Xpos, so you dont end up outside the array
        }
      if (currentBlock.blockPicker==9) {                                     //when the I piece is selected (blockpicker==9), and you're up against the wall, it adds 2 to your Xpos, because the I
        if (currentBlock.onEdgeRight) {                                      //piece is longer than normal, and would still rotate outside of the array using the normal fashion
          currentBlock.currentBlockX-=2;
        }
        if ((rotation==0 || rotation==2) && currentBlock.currentBlockX == grid.w-2) {  //if the I-block is 1 away from the wall in the vertical position, and you rotate, it subtracts 1 from your Xpos
          currentBlock.currentBlockX-=1;                                               //otherwise you would still rotate out of the array, because of the length of the I-piece
        }
        if (currentBlock.currentBlockY == 18) {                                        //if you rotate while in the horizontal position, and at 1 above the ground, it subtracts 1 from your Ypos, moving 
          currentBlock.currentBlockY -= 1;                                             //you upward. otherwise you could rotate outside of the array at the bottom of the screen
        }
      }
      rotation+=1;
      blockPlace.downCount=0;
      cooldown2 = 10;                                                        // the cooldown between each rotation is 10 frames
    }

    if (keysPressed[90] && currentBlock.currentBlockY < grid.h-1 && cooldown2 == 0 ) {
      if (currentBlock.onEdgeLeft==true && currentBlock.wallAnticlockwise) {           //same thing as the block of code above, except it checks everything against counter clockwise rotation
        currentBlock.currentBlockX+=1;
      } else
        if (currentBlock.onEdgeRight==true && currentBlock.wallAnticlockwise) {
          currentBlock.currentBlockX-=1;
        }
      if (currentBlock.blockPicker==9) {
        if (currentBlock.onEdgeRight) {
          currentBlock.currentBlockX-=2;
        }
        if ((rotation==0 || rotation==2) && currentBlock.currentBlockX == grid.w-2) {
          currentBlock.currentBlockX-=1;
        }
        if (currentBlock.currentBlockY == 18) {
          currentBlock.currentBlockY -= 1;
        }
      }
      rotation-=1;
      blockPlace.downCount=0;
      cooldown2 = 10;
    }
    if (keysPressed[83] && cooldown3 ==0) {        //when you press the s key, and the cooldown is inactive, it moves your block 1 place downwards
      if (blockPlace.land != true) {               //but only if your block is not touching anything on the bottom side of it, otherwise you would easily clip into other blocks, and the floor
        currentBlock.currentBlockY += 1;
        blockPlace.downCount-=1;
        currentTime = now;
      } else if (blockPlace.land == true) {        //if your block is touching something at the bottom, it calls all the functions necessairy to save its position to the filled[][] array
        blockPlace.check = true;
        blockPlace.fills();
      }
      cooldown3 = 5;                               //the cooldown between each downwards movement is 5 frames
    }
    if (cooldown1 > 0) cooldown1--;                //if the cooldown is active (cooldown > 0), it lowers the cooldown by 1 each frame
    if (cooldown2 > 0) cooldown2--;
    if (cooldown3 > 0) cooldown3--;

    if (rotation>3) {                              //if the rotation variable is higher than 3 (the 4th rotation position), it sets it to 0 (the 1st rotation position), so the rotation keeps looping
      rotation = 0;
    }
    if (rotation<0) {                              //if the rotation variable is lower than 1 (the 1st rotation position), it sets it to 3 (the 4th rotation position),  so the rotation keeps looping
      rotation = 3;
    }
    if (keysPressed[SHIFT] && !shiftLock) {
      hardDrop();
      shiftLock = true;
      println("bruh");
    }
  }

  void hardDrop() {
    if (currentBlock.blockPicker == 1) {
      int h;
      if(control.rotation == 0){
       h = 0;
      } else {
        h = 1;
      }
      for (int i = currentBlock.currentBlockY; i < grid.h-1; i++) {
        if ((i+h >= grid.h-1) ||
          ((grid.cells[tBlock.mainBlockX][i+h] == 1) ||
          ((grid.cells[tBlock.minX][i+h] == 1) && (tBlock.minX != tBlock.mainBlockX)) ||
          ((grid.cells[tBlock.maxX][i+h] == 1) && (tBlock.maxX != tBlock.mainBlockX)) ) ) {
          currentBlock.currentBlockY = i;
          return;
        }
      }
    }
    if (currentBlock.blockPicker == 2) {
      for (int i = currentBlock.currentBlockY; i < grid.h-1; i++) {
        if ((i+1 >= grid.h-1) || (grid.cells[oBlock.width2][i+1+1] == 1) || (grid.cells[oBlock.width3][i+1+1] == 1) ) {
          currentBlock.currentBlockY = i;
          return;
        } else {
          currentBlock.currentBlockY = grid.h-2;
        }
      }
    }
  }
}

// key a is linked to left button                .  left = left button
// key d is linked to right button               .  right = right button
// key s is linked to down button                .  down = down button
// key w is linked to the right soulder button   .  s = x button
// key z is linked to left shoulder button       .  up = up button
// key c is linked to A button                   .  x = a button
// spacebar is linked to Y button                .  a = y button
// esc is linked to select                       .  esc = start button
// enter is linked to start                      .  z = b button
