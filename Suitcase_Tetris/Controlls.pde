class Control {
  boolean lock1, lock2;
  int rotation;

  Control() {
    lock1 = false;
    lock2 = false;
    rotation = 1;
  }

  void movement() {
    if (key=='a' && !lock1 && keyPressed) {
      lock1 = true;
      tBlock.mainBlockX -= 1;
    } else
      if (key == 'd' && !lock1 && keyPressed) {
        lock1 = true;
        tBlock.mainBlockX += 1;
      } else {
        key=0;
        lock1 = false;
      }
  }

  void rotation() {
    if (key=='w' && !lock2 && keyPressed) {
      lock2 = true;
      tBlock.mainBlockX -= 1;
      println("yes");
    } else
      if (key == 'z' && !lock2 && keyPressed) {
        lock2 = true;
        tBlock.mainBlockX += 1;
      } else {
        key=0;
        lock2 = false;
      }
  }
}
