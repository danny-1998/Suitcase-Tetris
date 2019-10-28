//by Kiano Wortel

class Score {
  // what do i need to add
  // - is this block out of the top?
  //   - if yes: make the game stop
  //   - if no: do nothing


  boolean top = false;
  void scoreDraw() {

    if (top == true) {
      // stop the game
      currentBlock.newBlock = false;
      rect(0, 0, width, height);
    }
  }


// debug stuff ↓
  void keyPressed() {
    if (key == 'c') {
      top = true;
    }
  }
  
}
