class Control {
  //By Ole Neuman
  boolean firstPress;
  int rotation, cooldown1, cooldown2, cooldown3;
  boolean top = false;
  public boolean blockLeft, blockRight;

  Control() {
    rotation = 0;
    firstPress = true;
  }

  void controllsV3() {
    if (keysPressed[65] && currentBlock.minX > 0 && cooldown1 == 0 && !blockLeft) {
      currentBlock.currentBlockX -= 1;
      if (firstPress && home.e == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 3;
      }
      //De cooldown op de tijd tussen verplaatsingen naar links in Easy difficulty is hier 3
      if (firstPress && home.m == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 10;
      }
      //De cooldown op de tijd tussen verplaatsingen naar links in Medium difficulty is hier 10
      if (firstPress && home.h == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 15;
      }
    }
    //De cooldown op de tijd tussen verplaatsingen naar links in Hard difficulty is hier 15
    if (keysPressed[68] && currentBlock.maxX < grid.w-1 && cooldown1 == 0 && !blockRight) {
      currentBlock.currentBlockX += 1;
      if (firstPress && home.e == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 3;
      }
      //De cooldown op de tijd tussen verplaatsingen naar rechts in Easy difficulty is hier 3
      if (firstPress && home.m == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 10;
      }
      //De cooldown op de tijd tussen verplaatsingen naar rechts in Medium difficulty is hier 10
      if (firstPress && home.h == true) {
        firstPress = false;
        cooldown1 = 25;
      } else {
        firstPress = false;
        cooldown1 = 15;
      }
      //De cooldown op de tijd tussen verplaatsingen naar rechts in Hard difficulty is hier 15
    }

    if (keysPressed[87] && cooldown2 == 0) {
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
      fill(random(255), random(255), random(255));
      if (blockPlace.land != true) {
        currentBlock.currentBlockY += 1;
      } else if (blockPlace.land == true) {
        blockPlace.check = true;
        blockPlace.fills();
      }
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
