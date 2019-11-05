//by Kiano Wortel

class Score {
  // what do i need to add
  // - is this block out of the top?
  //   - if yes: make the game stop
  //   - if no: do nothing

  boolean GameOver = false;
  boolean BlockOverBlock = false;

  void scoreDraw() {
    for (int i = 0; i < grid.w; i++) {
      if ((currentBlock.newBlock == true) && (blockPlace.filled[i][0] > 0)) {
        GameOver = true;
        println("OwO");
      }
      if (blockPlace.filled[2][11] == 1) {
        GameOver = true;
      }
    }
  }
  void gameOver() {
    if (control.top == true) {
      // stop the game
      GameOver = true;
    }
    if (GameOver == true) {
      noStroke();
      fill(255, 0, 0);
      rect(0, 0, width, height);
    }
  }
}
