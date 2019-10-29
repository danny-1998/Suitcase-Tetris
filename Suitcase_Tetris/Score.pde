//by Kiano Wortel

class Score {
  // what do i need to add
  // - is this block out of the top?
  //   - if yes: make the game stop
  //   - if no: do nothing

  boolean GameOver = false;
  boolean top = false;
  void scoreDraw() {

    if (control.top == true) {
      // stop the game
      GameOver = true;
    }
    if (GameOver == true) {
      noStroke();
      fill(255,0,0);
      rect(0,0,width,height);
    }
  }
}
