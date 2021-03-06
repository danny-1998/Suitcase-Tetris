//by Kiano Wortel, Danny Ha and Jeffrey Baas

class Score {
  // in deze class wordt bijhouden of de speler game over is en wat zijn/haar score is
  int Score = 0;
  float TextX = 850;
  float TextY = height/2;
  float ScoreX = width/2 - 880;
  float ScoreY = height/2 - 250 ;
  boolean gameOver = false;
  boolean checkPoint = false;
  boolean blockOverBlock = false;
  boolean[][] scorePlus = new boolean[22][20];
  boolean lock;
  float filledPercentage;


  void scoreDraw() {
    // als er een blok boven de "koffer" uit steekt betekend het GameOver
    for (int i = 0; i < grid.w; i++) {
      //dit is de code voor de melding die je krijgt als score >= 60%
      if (filledPercentage > 60/*blockPlace.filled[i][12] == 1*/) {
        textSize(100);
        fill(255, 0, 0);
        text("Next", 10, 550);
        text("suitcase?", 10, 600);
        text("Press Y!", 10, 650);
        if (keysPressed[32]) {
          //alles gaat sneller en grid wordt gecleared
          grid.gridClear();
          blockPlace.filledClear();
          blockPlace.blockCount = 0;
          dt1 = dt1 - (22/10);
          dt2 = dt2 - (22/15);
          dt3 = dt3 - (22/22);
          for (int w = 0; w < 22; w++) {
            for (int h = 0; h<20; h++) {  
              scorePlus[w][h] = false;
            }
          }
        }
      }
      if (filledPercentage == 100) {
        grid.gridClear();
        blockPlace.filledClear();
        blockPlace.blockCount = 0;
        dt1 = dt1 - (22/10);
        dt2 = dt2 - (22/15);
        dt3 = dt3 - (22/22);
        Score = Score + 25000;
      }
      if ((currentBlock.newBlock == true) && (blockPlace.filled[i][7] > 0)) {
        gameOver = true;
        upload = true;
      }

      if (blockPlace.filled[2][5] == 1) {
        gameOver = true;
        upload = true;
      }
    }
  }
  void gameOver() {
    if (control.top == true) {
      // stop the game
      gameOver = true;
    }
    // game over screen
    if (gameOver == true) {
      if(upload && !uploaddone){
        punten = Score;
        println("Uploading score...");
        AllScores();
        upload = false;
        uploaddone = true;
      }
      //println("lol");
      home.gameState = "gameOver";
      fill(255, 0, 0);
      rect(0, 0, width, height);
      textMode(CENTER);
      fill(255);
      textSize(100);
      DatabaseText();;  if (keysPressed[ENTER]) {
        uploaddone = false;
        recordCount = 0;
        grid.gridClear();
        blockPlace.filledClear();
        gameOver = false;
        Score = 0;
        home.easy = false;
        home.balanced = false;
        home.insane = false;
        dt1 = 1000;
        dt2 = 500;
        dt3 = 200;
      }
    }

    if (score.gameOver == true) {
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
        if (blockPlace.filled[w][h] == 1 && scorePlus[w][h] == false) {
          scorePlus[w][h] = true;
          Score += 50;
        }
        textSize(100);
        text(Score, ScoreX, ScoreY);
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
    text(sd+"/100%", 10, 500);
  }
}
