//by Kiano Wortel, Danny Ha and Jeffrey Baas

class Score {
  // in deze class wordt bijhouden of de speler game over is en wat zijn/haar score is
  int Score = 0;
  float Textx = 850;
  float Texty = height/2;
  float Scorex = width/2 - 880;
  float Scorey = height/2 - 250 ;
  boolean GameOver = false;
  boolean CheckPoint = false;
  boolean BlockOverBlock = false;
  boolean[][] ScorePlus = new boolean[22][20];
  boolean lock;


  void scoreDraw() {
    // als er een blok boven de "koffer" uit steekt betekend het GameOver
    for (int i = 0; i < grid.w; i++) {
      if (blockPlace.filled[i][12] == 1) {
        textSize(48);
        fill(255, 0, 0);
        text("Next suitcase?", 10, 10);
        if (keysPressed[32]) {
          grid.gridClear();
          blockPlace.filledClear();
          blockPlace.uwu = 0;
          for (int w = 0; w < 22; w++) {
            for (int h = 0; h<20; h++) {  
              ScorePlus[w][h] = false;
            }
          }
        }
      }
      if ((currentBlock.newBlock == true) && (blockPlace.filled[i][7] > 0)) {
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
    // game over screen
    if (GameOver == true) {
      home.gameState = 3;
      fill(255, 0, 0);
      rect(0, 0, width, height);
      textMode(CENTER);
      fill(255);
      textSize(80);
      text(Score, Textx, Texty);
      if (keysPressed[ENTER]) {
          grid.gridClear();
          blockPlace.filledClear();
          GameOver = false;
          Score = 0;
          home.e = false;
          home.m = false;
          home.h = false;
      }
    }

    if (score.GameOver == true) {
      bgmusic.stop();
      if (!lock) {
        gameover.play();
        lock = true;
      }
    } else {
      if (lock) {
        lock = false;
      }
    }
  }

  // vanaf hier is alle code voor het aantal punten dat de speler krijgt
  void scoreCounter() {
    for (int w = 0; w < 22; w++) {
      for (int h = 0; h<20; h++) {  
        // voor ieder gevulde gridspace krijgt de speler 50 punten
        if (blockPlace.filled[w][h] == 1 && ScorePlus[w][h] == false) {
          ScorePlus[w][h] = true;
          Score += 50;
        }
        textSize(24);
        text(Score, Scorex, Scorey);
      }
    }
  }
}
