class Control {
  //By Ole Neuman
  boolean lock;
  int rotation;
  boolean top = false;

  Control() {
    lock = false;
    rotation = 0;
  }

  void movement() {
    if (key == 'c') {
      top = true;
    }
    if (key=='a' && !lock && keyPressed&&currentBlock.minX>=1) {   //if a is pressed, moves block to left
      lock = true;
      currentBlock.currentBlockX -= 1;
    } else
      if (key == 'd' && !lock && keyPressed&&currentBlock.maxX<=grid.w-2) {  //if d is pressed, moves block to right
        lock = true;
        currentBlock.currentBlockX += 1;
      } else 
      if (key == 'w' && !lock && keyPressed) {  //if w is pressed, rotates block clockwise
        if (currentBlock.onEdgeLeft==true) {           //if the block is pressed against the wall with the center of rotation, it gets pushed one to the side so it doesnt rotate out of the grid
          currentBlock.currentBlockX+=1;
        } else
          if (currentBlock.onEdgeRight==true) {
            currentBlock.currentBlockX-=1;
          }
        lock = true;
        rotation += 1;
      } else
        if (key == 's' && !lock && keyPressed) {  //if s is pressed, get DOWN (toegevoegd door yves)
          currentBlock.currentBlockY += 1;
        } else
          if (key == 'z' && !lock && keyPressed) {  // if z is pressed, rotates block counterclockwise
            if (currentBlock.onEdgeLeft==true) {           //if the block is pressed against the wall with the center of rotation, it gets pushed one to the side so it doesnt rotate out of the grid
              currentBlock.currentBlockX+=1;
            } else
              if (currentBlock.onEdgeRight==true) {
                currentBlock.currentBlockX-=1;
              }
            lock = true;
            rotation -= 1;
          } else {
            key=0;
            lock = false;
            lock = false;
          }
   
  }

  void keyPressed() {
    if (key==CODED) {
    }
    if (keyCode == UP && !lock) {
      if (currentBlock.onEdgeLeft && currentBlock.wallClockwise) {
        currentBlock.currentBlockX+=1;
      } else if (currentBlock.onEdgeRight && currentBlock.wallClockwise) {
        currentBlock.currentBlockX-=1;
      }
      rotation+=1;
      lock = true;
    } else if (keyCode == 90 && !lock) {
      if (currentBlock.onEdgeLeft && currentBlock.wallAnticlockwise) {
        currentBlock.currentBlockX+=1;
      } else if (currentBlock.onEdgeRight && currentBlock.wallAnticlockwise) {
        currentBlock.currentBlockX-=1;
      }
      rotation-=1;
      lock = true;
    } else if (keyCode == DOWN && keyPressed) {
      currentBlock.currentBlockY+=1;
    } else if (keyCode == LEFT && currentBlock.minX > 0 && !lock) {
      currentBlock.currentBlockX-=1;
      lock = true;
    } else if (keyCode == RIGHT && currentBlock.maxX < grid.w-1 && !lock) {
      currentBlock.currentBlockX+=1;
      lock = true;
    } else if (keyCode == 67 && !lock){
      top = true;
    } else if (keyCode == 0 && lock) {
      lock = false;
    } else if (!keyPressed) {
      keyCode = 0;
      lock = false;
    }
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
