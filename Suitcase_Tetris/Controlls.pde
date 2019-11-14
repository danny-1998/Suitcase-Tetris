class Control {
  //By Ole Neuman
  boolean firstPress;
  int rotation, cooldown1, cooldown2, cooldown3;
  boolean top = false;

  Control() {
    rotation = 0;
    firstPress = true;
  }

  void controllsV3() {
    if (keysPressed[LEFT] && currentBlock.minX > 0 && cooldown1 == 0) {
      currentBlock.currentBlockX -= 1;
      if (firstPress) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        cooldown1 = 3;
      }
    }

    if (keysPressed[RIGHT] && currentBlock.maxX < grid.w-1 && cooldown1 == 0) {
      currentBlock.currentBlockX += 1;
      if (firstPress) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        cooldown1 = 3;
      }
    }

    if (keysPressed[UP] && cooldown2 == 0) {
      if (currentBlock.onEdgeLeft && currentBlock.wallClockwise) {           
        currentBlock.currentBlockX+=1;
      } else
        if (currentBlock.onEdgeRight && currentBlock.wallClockwise) {
          currentBlock.currentBlockX-=1;
        }
      if (currentBlock.blockPicker==9) {
        if (currentBlock.onEdgeRight) {
          currentBlock.currentBlockX-=2;
        }
        if ((rotation==0 || rotation==2) && currentBlock.currentBlockX == grid.w-2) {
          currentBlock.currentBlockX-=1;
        }
      }
      rotation+=1;
      cooldown2 = 10;
    }

    if (keysPressed[90] && currentBlock.currentBlockY > grid.h-1 && cooldown2 == 0 ) {
      if (currentBlock.onEdgeLeft==true && currentBlock.wallAnticlockwise) {           //if the block is pressed against the wall with the center of rotation, it gets pushed one to the side so it doesnt rotate out of the grid
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
      }
      rotation-=1;
      cooldown2 = 10;
    }
    if (keysPressed[DOWN] && cooldown3 ==0) {
      currentBlock.currentBlockY+=1;
      cooldown3 = 5;
    }
    if (cooldown1 > 0) cooldown1--;
    if (cooldown2 > 0) cooldown2--;
    if (cooldown3 > 0) cooldown3--;

    if (rotation>3) {
      rotation = 0;
    }
    if (rotation<0) {
      rotation = 3;
    }
    if (rotation>3) {
      rotation = 0;
    }
    if (rotation<0) {
      rotation = 3;
    }
  }
}
