// by Kiano Wortel

class HomeScreen {
  // deze class bevat het hoofd menu en een temporary level/difficulty select
  boolean gameStart = false;
  boolean level = false;
  boolean e = false;
  boolean m = false;
  boolean h = false;
  boolean t = false;
  boolean musicLooping;
  int gameState;





  void homeDraw() {
    // gameStart houdt in dat de game bezig is (er zijn blokken die vallen)
    if (gameState == 0) {
      fill (255, 174, 201);
      rect(0, 0, width, height);
      textMode(CENTER);
      textSize(50);
      fill(0);
      text("Press START to continue", score.Textx-75, 3*(height/4));
      spriteSheet.update();
      spriteSheet.draw(2*(width/7), height/4);
      //image(logo, 2*(width/7), height/4);
    }
    // temporary level select tool
    if (gameState == 1) {
      image(Level, 0, 0, width, height);
    }
    // e = easy, m = medium, h = hard. dit verandert de kleur van de blokken: e=groen m=blauw h=rood
    if (e == true) {
      fill(0, 255, 0);
    }
    if (m == true) {
      fill(0, 255, 255);
    }
    if (h == true) {
      fill(255, 0, 0);
    }
  }
  void screenSelector() {
    if (gameState == 0) {
      if (!musicLooping) {               //if the music is not looping yet, it starts to play the background music, and activates the musicLooping boolean
        bgmusic.loop();
        musicLooping = true;
      }
      if (keysPressed[ENTER]) {          //when you press enter, you advance the gameState to 1
        gameState = 1;
      }
    }
    if (gameState == 1) {             //if the music is not looping yet, it starts to play the background music, and activates the musicLooping boolean
      if (!musicLooping) {
        bgmusic.loop();
        musicLooping = true;
      }
      if (keysPressed[49] || keysPressed[97]) {          //if you press the 1 key (2nd number is for the numpad) it activates easy mode and advances the gameState to 2
        e = true;
        gameState = 2;
      } else if (keysPressed[50] || keysPressed[98]) {
        m = true;                                        //if you press the 2 key it activates medium mode and advances the gameState to 2
        gameState = 2;
      } else if (keysPressed[51] || keysPressed[99]) {
        h = true;                                        //if you press the 3 key it activates hard mode, and advances the gameState to 3
        gameState = 2;
      }
      if (keysPressed[52] || keysPressed[100]) {
        t = true;
        gameState = 4;
      }
    }
    if (gameState == 2) {
      gameStart = true;                            //if the gameState is at 2, it starts the gameplay itself. If you die in the game, the gameState advances to 3
      if (e == true){
      image(gameE, 0, 0);
      }
      if (m == true){
      image(gameE, 0, 0);
      }
      if (h == true){
      image(gameE, 0, 0);
      }
      if (!musicLooping) {                         //if the music is not looping yet, it starts to play the background music, and activates the musicLooping boolean
        bgmusic.loop();
        musicLooping = true;
      }
    } else {                                        //if the gameState is not 2, none of the gameplay code is run, which makes everything a bit more efficient
      gameStart = false;
    }
    if (gameState == 3) {                            
      bgmusic.stop();                               //if the gameState is 3, the background music is stopped, and musicLooping is deactivated
      musicLooping = false;
      if (keysPressed[ENTER]) {                     //if you press the ENTER key, it resets all the variables which directly impact gameplay, and reverts the gameState to 1, so you can start the game again
        gameState = 1;
        grid.gridClear();
        blockPlace.filledClear();
        blockPlace.uwu = 0;
        for (int w = 0; w < 22; w++) {
          for (int h = 0; h<20; h++) {  
            score.ScorePlus[w][h] = false;
          }
        }
        score.Score = 0;
      }
    }
    if (gameState == 4) {
      tutorial.draw();
    }
  }
}
