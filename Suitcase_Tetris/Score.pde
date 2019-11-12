//by Kiano Wortel

class Score {
  // what do i need to add
  // - is this block out of the top?
  //   - if yes: make the game stop
  //   - if no: do nothing

  //how many points is one block worth:
  //  - T = 200
  //  - S = 200
  //  - O = 200
  //  - I = 200
  //  - Z = 200
  //  - J = 200
  //  - L = 200
  //  - . = 50
  //  - , = 150

  int Score = 0;
  float Textx = 850;
  float Texty = height/2;
  boolean GameOver = false;
  boolean BlockOverBlock = false;
  boolean[][] ScorePlus = new boolean[22][20];
  
  
  void scoreDraw() {
    
    for (int i = 0; i < grid.w; i++) {
      if ((currentBlock.newBlock == true) && (blockPlace.filled[i][1] > 0)) {
        GameOver = true;
      }
      if (blockPlace.filled[2][5] == 1) {
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
      textMode(CENTER);
      fill(255);
      textSize(80);
      text(Score, Textx, Texty);
    }
  }

  void scoreCounter() {
    for(int w = 0; w < 22; w++){
      for(int h = 0; h<20; h++){  
    if (blockPlace.filled[w][h] == 1 && ScorePlus[w][h] == false) {
      ScorePlus[w][h] = true;
      Score += 50;
    }
    text(Score, 50, 50);
      }
    }
  }
}
