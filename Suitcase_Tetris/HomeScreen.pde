// by Kiano Wortel

class HomeScreen {
  // deze class bevat alle verschillende schermen
  // homescreen, difficulty select en mogelijkheid om naar de verschillende modus te gaan
  boolean gameStart = false;
  boolean level = false;
  boolean e = false;
  boolean balanced = false;
  boolean h = false;
  boolean t = false;
  boolean Eselect = true;
  boolean Bselect = false;
  boolean Iselect = false;
  boolean Tselect = false;
  boolean musicLooping;
  float pointX;
  float pointY;
  int gameState;
  int navi;
  boolean press;





  void homeDraw() {
    // gameStart houdt in dat de game bezig is (er zijn blokken die vallen)
    if (gameState == 0) {
      fill (255, 174, 201);
      rect(0, 0, width, height);
      textMode(CENTER);
      textSize(50);
      fill(0);
      text("Press B to continue", score.Textx-75, 3*(height/4));
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
      image(Pointer, pointX, pointY);
      pointY = height - (height / 4);
      if (Eselect == true) {
        pointX = width / 16;
        Bselect = false;
        Iselect = false;
        Tselect = false;
      }
      if (Bselect == true) {
        pointX = (width / 16)*5;
        Eselect = false;
        Iselect = false;
        Tselect = false;
      }
      if (Iselect == true) {
        pointX = (width / 16)*9;
        Eselect = false;
        Bselect = false;
        Tselect = false;
      }
      if (Tselect == true) {
        pointX = (width / 16)*13;
        Eselect = false;
        Bselect = false;
        Iselect = false;
      }
    }
    // e = easy, m = medium/balanced, h = hard/insane. dit verandert de sprites en snelheid van de blokken: e=groen m=blauw h=rood
    if (e == true) {
      fill(0, 255, 0);
    }
    if (balanced == true) {
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
      // dit zorgt ervoor dat de pointer kan bewegen
      //to the right
      if (keyCode == 68) {
        if (press == false) {
          navi++;
          press = true;
        }
      }
      if (keyCode != 68 && keyCode != 65) {
        if (press == true) {
          press = false;
        }
      }
      println(navi);
      if (navi > 3) {
        navi = 3;
      }
      //to the left
      if (keyCode == 65) {
        if (press == false) {
          navi--;
          press = true;
        }
      }


      if (navi < 0) {
        navi = 0;
      }
      //easy naar balanced
      if (navi == 1 && Eselect == true) {
        Eselect = false;
        Bselect = true;
      }
      //balanced naar insane
      if (navi == 2 && Bselect == true) {
        Bselect = false;
        Iselect = true;
      }
      //insane naar tutorial
      if (navi == 3 && Iselect == true) {
        Iselect = false;
        Tselect = true;
      }
      //tutorial naar insane
      if (navi == 2 && Tselect == true) {
        Tselect = false;
        Iselect = true;
      }
      //insane naar balanced
      if (navi == 1 && Iselect == true) {
        Iselect = false;
        Bselect = true;
      }
      //balanced naar easy
      if (navi == 0 && Bselect == true) {
        Bselect = false;
        Eselect = true;
      }
      if (keysPressed[49] || keysPressed[97] || (pointX == width / 16 && keysPressed[67])) {          //if you press the 1 key (2nd number is for the numpad) it activates easy mode and advances the gameState to 2
        e = true;
        gameState = 2;
      } else if (keysPressed[50] || keysPressed[98] || (pointX == (width / 16)*5 && keysPressed[67])) {
        balanced = true;                                        //if you press the 2 key it activates medium mode and advances the gameState to 2
        gameState = 2;
      } else if (keysPressed[51] || keysPressed[99] || (pointX == (width / 16)*9 && keysPressed[67])) {
        h = true;                                        //if you press the 3 key it activates hard mode, and advances the gameState to 3
        gameState = 2;
      }
      if (keysPressed[52] || keysPressed[100] || (pointX == (width / 16)*13 && keysPressed[67] && Tselect == true)) {
        t = true;
        gameState = 4;
      }
    }
    if (gameState == 2) {
      gameStart = true;                            //if the gameState is at 2, it starts the gameplay itself. If you die in the game, the gameState advances to 3
      if (e == true) {
        image(gameE, 0, 0);
      }
      if (balanced == true) {
        image(gameB, 0, 0);
      }
      if (h == true) {
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
            score.ScorePlus[w][h] = false;
          }
        }
        score.Score = 0;
      }
    }
    if (gameState == 4) {
      if (t == true) {
        image(gameT, 0, 0);
      }
      tutorial.draw();
    }
  }
}
