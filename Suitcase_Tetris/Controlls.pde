class Control {
  float blockX = width/2;
  float blockY = 200;
  int moveDistance = 50;
  boolean lock = false;
  Control() {
  }


  void blockDraw() {        //draws the current block

    rectMode(CENTER);
    rect(blockX, blockY, 100, 200);
  }


  void movement() {
    if (key=='a' && !lock) {
      blockX -= moveDistance;
      lock = true;
    } else
      if (key == 'd' && !lock) {
        blockX += moveDistance; 
        lock = true;
      } else {
      key=0;
      lock = false;
    }
    println(lock);
  }
}
