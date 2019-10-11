class Control {
  boolean lock1, lock2;
  int rotation;

  Control() {
    lock1 = false;
    lock2 = false;
    rotation = 1;
  }

  void movement() {
    
    if (key=='a' && !lock1 && keyPressed) {   //moves block to left
      lock1 = true;
      tBlock.mainBlockX -= 1;
    } else
      if (key == 'd' && !lock1 && keyPressed) {  //moves block to right
        lock1 = true;
        tBlock.mainBlockX += 1;
      }else 
       if (key == 'w' && !lock2 && keyPressed) {  // 
      lock2 = true;
      rotation += 1;
    } else
      if (key == 'z' && !lock2 && keyPressed) {
        lock2 = true;
        rotation -= 1;
      } else {
        key=0;
        lock1 = false;
        lock2 = false;
      }
      if(rotation>3){
       rotation = 0; 
      }
      if(rotation<0){
       rotation = 1; 
      }
  }
}
