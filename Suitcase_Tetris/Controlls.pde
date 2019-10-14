class Control {
  //By Ole Neuman
  boolean lock1, lock2;
  int rotation;

  Control() {
    lock1 = false;
    lock2 = false;
    rotation = 0;
  }

  void movement() {

    if (key=='a' && !lock1 && keyPressed&&currentBlock.minX>=1) {   //if a is pressed, moves block to left
      lock1 = true;
      currentBlock.currentBlockX -= 1;
    } else
      if (key == 'd' && !lock1 && keyPressed&&currentBlock.maxX<=grid.w-2) {  //if d is pressed, moves block to right
        lock1 = true;
        currentBlock.currentBlockX += 1;
      } else 
      if (key == 'w' && !lock2 && keyPressed) {  //if w is pressed, rotates block clockwise
        if (currentBlock.onEdgeLeft==true) {           //if the block is pressed against the wall with the center of rotation, it gets pushed one to the side so it doesnt rotate out of the grid
          currentBlock.currentBlockX+=1;
        } else
          if (currentBlock.onEdgeRight==true) {
            currentBlock.currentBlockX-=1;
          }
        lock2 = true;
        rotation += 1;
      } else
        if (key == 'z' && !lock2 && keyPressed) {  // if z is pressed, rotates block counterclockwise
          if (currentBlock.onEdgeLeft==true) {           //if the block is pressed against the wall with the center of rotation, it gets pushed one to the side so it doesnt rotate out of the grid
            currentBlock.currentBlockX+=1;
          } else
            if (currentBlock.onEdgeRight==true) {
              currentBlock.currentBlockX-=1;
            }
          lock2 = true;
          rotation -= 1;
        } else {
          key=0;
          lock1 = false;
          lock2 = false;
        }
    if (rotation>3) {
      rotation = 0;
    }
    if (rotation<0) {
      rotation = 3;
    }
  }
}
