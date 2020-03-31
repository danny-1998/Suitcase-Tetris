// by Kiano Wortel

class HomeScreen {
  // deze class bevat alle verschillende schermen
  // homescreen, difficulty select en mogelijkheid om naar de verschillende modus te gaan
  boolean gameStart = false;
  boolean level = false;
  boolean easy = false;
  boolean balanced = false;
  boolean insane = false;
  boolean tutorial = false;
  boolean easySelected = true;
  boolean balancedSelected = false;
  boolean insaneSelected = false;
  boolean tutorialSelected = false;
  boolean musicLooping;
  float pointX;
  float pointY;
  int gameState;
  int navigation;
  boolean press;





  void homeDraw() {
    // gameStart houdt in dat de game bezig is (er zijn blokken die vallen)
    if (gameState == 0) {
      fill (255, 174, 201);
      rect(0, 0, width, height);
      textMode(CENTER);
      textSize(50);
      fill(0);
      text("Press B to continue", score.TextX-75, 3*(height/4));
      spriteSheet.update();
      spriteSheet.draw(2*(width/7), height/4);
      //image(logo, 2*(width/7), height/4);
    }
    // gamestate 0 = home screen
    // gamestate 1 = difficulty select
    // gamestate 2 = game
    // gamestate 3 = game over
    // gamestate 4 = tutorial
    if (gameState == 1) {
      image(Level, 0, 0, width, height);
      image(pointer, pointX, pointY);
      pointY = height - (height / 4);
      if (easySelected == true) {
        pointX = width / 16;
        balancedSelected = false;
        insaneSelected = false;
        tutorialSelected = false;
      }
      if (balancedSelected == true) {
        pointX = (width / 16)*5;
        easySelected = false;
        insaneSelected = false;
        tutorialSelected = false;
      }
      if (insaneSelected == true) {
        pointX = (width / 16)*9;
        easySelected = false;
        balancedSelected = false;
        tutorialSelected = false;
      }
      if (tutorialSelected == true) {
        pointX = (width / 16)*13;
        easySelected = false;
        balancedSelected = false;
        insaneSelected = false;
      }
    }
    // e = easy, m = medium/balanced, h = hard/insane. dit verandert de sprites en snelheid van de blokken: e=groen m=blauw h=rood
    if (easy) {
      fill(0, 255, 0);
    }
    if (balanced) {
      fill(0, 255, 255);
    }
    if (insane) {
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
      // dit zorgt ervoor dat de pointer kan bewegen
      //to the right
      if (keyCode == 68) {
        if (!press) {
          navigation++;
          press = true;
        }
      }
      if (keyCode != 68 && keyCode != 65) {
        if (press) {
          press = false;
        }
      }
      println(navigation);
      if (navigation > 3) {
        navigation = 3;
      }
      //to the left
      if (keyCode == 65) {
        if (!press) {
          navigation--;
          press = true;
        }
      }


      if (navigation < 0) {
        navigation = 0;
      }
      //easy naar balanced
      if (navigation == 1 && easySelected) {
        easySelected = false;
        balancedSelected = true;
      }
      //balanced naar insane
      if (navigation == 2 && balancedSelected) {
        balancedSelected = false;
        insaneSelected = true;
      }
      //insane naar tutorial
      if (navigation == 3 && insaneSelected) {
        insaneSelected = false;
        tutorialSelected = true;
      }
      //tutorial naar insane
      if (navigation == 2 && tutorialSelected) {
        tutorialSelected = false;
        insaneSelected = true;
      }
      //insane naar balanced
      if (navigation == 1 && insaneSelected) {
        insaneSelected = false;
        balancedSelected = true;
      }
      //balanced naar easy
      if (navigation == 0 && balancedSelected) {
        balancedSelected = false;
        easySelected = true;
      }
      if (keysPressed[49] || keysPressed[97] || (pointX == width / 16 && keysPressed[67])) {          //if you press the 1 key (2nd number is for the numpad) it activates easy mode and advances the gameState to 2
        easy = true;
        gameState = 2;
      } else if (keysPressed[50] || keysPressed[98] || (pointX == (width / 16)*5 && keysPressed[67])) {
        balanced = true;                                        //if you press the 2 key it activates medium mode and advances the gameState to 2
        gameState = 2;
      } else if (keysPressed[51] || keysPressed[99] || (pointX == (width / 16)*9 && keysPressed[67])) {
        insane = true;                                        //if you press the 3 key it activates hard mode, and advances the gameState to 3
        gameState = 2;
      }
      if (keysPressed[52] || keysPressed[100] || (pointX == (width / 16)*13 && keysPressed[67] && tutorialSelected == true)) {
        tutorial = true;
        gameState = 4;
      }
    }
    if (gameState == 2) {
      gameStart = true;                            //if the gameState is at 2, it starts the gameplay itself. If you die in the game, the gameState advances to 3
      if (easy) {
        image(gameE, 0, 0);
      }
      if (balanced) {
        image(gameB, 0, 0);
      }
      if (insane) {
        image(gameI, 0, 0);
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
            score.scorePlus[w][h] = false;
          }
        }
        score.Score = 0;
      }
    }
    if (gameState == 4) {
      if (tutorial) {
        image(gameT, 0, 0);
      }
      tutorial.draw();
    }
  }
}
