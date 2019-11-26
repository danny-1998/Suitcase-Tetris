//by Kiano Wortel

class Score {
// in deze class wordt bijhouden of de speler game over is en wat zijn/haar score is
  int Score = 0;
  float Textx = 850;
  float Texty = height/2;
  boolean GameOver = false;
  boolean BlockOverBlock = false;
  boolean[][] ScorePlus = new boolean[22][20];


  void scoreDraw() {
// als er een blok boven de "koffer" uit steekt betekend het GameOver
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
    // game over screen
    if (GameOver == true) {
      fill(255,0,0);
      rect(0, 0, width, height);
      textMode(CENTER);
      fill(255);
      textSize(80);
      text(Score, Textx, Texty);
    }

    if (score.GameOver == true) {
      bgmusic.stop();
      //      whateverthenewmusicsnameis.loop();
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
        text(Score, 50, 50);
      }
    }
  }
}
