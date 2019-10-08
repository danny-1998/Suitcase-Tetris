class Control {
  float blockX = width/2;
  float blockY = 200;
  int moveDistance = 50;
  boolean lock = false;
  int rotation = 0;

  void movement() {
    if (key=='a' && !lock && keyPressed) {
      lock = true;
      tBlock.mainBlockW -= 1;
    } else
      if (key == 'd' && !lock && keyPressed) {
        lock = true;
        tBlock.mainBlockW += 1;
      } else {
        key=0;
        lock = false;
      }
  }

  void rotation() {
    if (key=='w' && !lock && keyPressed) {
      lock = true;
      rotation -= 1;
    } else
      if (key == 'z' && !lock && keyPressed) {
        lock = true;
        rotation += 1;
      } else {
        key=0;
        lock = false;
      }
  }
}
