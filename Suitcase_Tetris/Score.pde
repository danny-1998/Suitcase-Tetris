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
  float filledPercentage;


  void scoreDraw() {
    // als er een blok boven de "koffer" uit steekt betekend het GameOver
    for (int i = 0; i < grid.w; i++) {
      if (filledPercentage > 60/*blockPlace.filled[i][12] == 1*/) {
        textSize(100);
        fill(255, 0, 0);
        text("Next suitcase?", 100, 550);
        text("Press Y!", 100, 600);
        if (keysPressed[32]) {
          grid.gridClear();
          blockPlace.filledClear();
          blockPlace.uwu = 0;
          dt1 = dt1 - (22/10);
          dt2 = dt2 - (22/15);
          dt3 = dt3 - (22/22);
          for (int w = 0; w < 22; w++) {
            for (int h = 0; h<20; h++) {  
              ScorePlus[w][h] = false;
            }
          }
        }
      }
      if (filledPercentage == 100) {
        grid.gridClear();
        blockPlace.filledClear();
        blockPlace.uwu = 0;
        dt1 = dt1 - (22/10);
        dt2 = dt2 - (22/15);
        dt3 = dt3 - (22/22);
        Score = Score + 25000;
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
      textSize(100);
      text(Score, Textx, Texty);
      if (keysPressed[ENTER]) {
        grid.gridClear();
        blockPlace.filledClear();
        GameOver = false;
        Score = 0;
        home.e = false;
        home.m = false;
        home.h = false;
        dt1 = 1000;
        dt2 = 500;
        dt3 = 200;
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
        textSize(100);
        text(Score, Scorex, Scorey);
      }
    }
  }

  void filledCounter() {
    filledAmount = 0;
    for (int w = 0; w < 22; w++) {
      for (int h = 0; h<20; h++) {  
        // voor ieder gevulde gridspace krijgt de speler 50 punten
        if (blockPlace.filled[w][h] == 1) {
          filledAmount+=1;
        }
      }
    }
    filledPercentage = filledAmount/264*100;
    textSize(100);
    String sd = nf(filledPercentage, 0, 1);
    text(sd+"/100%", 100, 500);
  }
}
