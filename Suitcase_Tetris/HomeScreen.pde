// by Kiano Wortel

class HomeScreen {
  // deze class bevat alle verschillende schermen
  // homescreen, difficulty select en mogelijkheid om naar de verschillende modus te gaan
  boolean gameStart;
  boolean level;
  boolean easy;
  boolean balanced;
  boolean insane;
  boolean tutorial;
  boolean musicLooping;
  float pointXstandard = width/16;
  float pointX = pointXstandard;
  float pointXAddEasy = 1;
  float pointXAddBalanced = 5;
  float pointXAddInsane = 9;
  float pointXAddTutorial = 13;
  float pointY;
  int difficultyScaler;
  boolean press;
  String gameState = "homeScreen";
  // gameState 1 = homeScreen
  // gameState 2 = levelSelect
  // gameState 3 = play
  // gameState 4 = gameOver
  // gameState 5 = tutorial
  String select = "easy";
  //select 1 = easy
  //select 2 = balanced
  //select 3 = insane
  //select 4 = tutorial
  StringList letters = new StringList();
  String userName = "";
  String passWord = "";
  Boolean userNameSelected = true;



  void homeDraw() {
    // gameStart houdt in dat de game bezig is (er zijn blokken die vallen)
    if (gameState == "homeScreen") {
      fill (255, 174, 201);
      rect(0, 0, width, height);
      String[] singleLetters = letters.array();
      if(userNameSelected){
      userName = join(singleLetters, "");
      } else {
      passWord = join(singleLetters, "");  
      }
      textMode(CENTER);
      textSize(50);
      fill(0);
      text("Username", score.TextX-75, 3*(height/4));
      text("Password", score.TextX-75, 3*(height/4)+30);
      spriteSheet.update();
      spriteSheet.draw(2*(width/7), height/4);
      //image(logo, 2*(width/7), height/4);
    }

    if (gameState == "levelSelect") {

      image(Level, 0, 0, width, height);
      image(pointer, pointX, pointY);
      pointY = height - (height / 4);

      //location of the pointer
      switch (select) {
      case "easy": 
        pointX = pointXstandard * pointXAddEasy;
        break;
      case "balanced":
        pointX = pointXstandard * pointXAddBalanced;
        break;
      case "insane": 
        pointX = pointXstandard * pointXAddInsane;
        break;
      case "tutorial":
        pointX = pointXstandard * pointXAddTutorial;
        break;

      default:
        println("error in select");
        break;
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
    if (gameState == "homeScreen") {
      if (!musicLooping) {               //if the music is not looping yet, it starts to play the background music, and activates the musicLooping boolean
        bgmusic.loop();
        musicLooping = true;
      }
      if (keysPressed[ENTER]) {          //when you press enter, you advance the gameState to 1
        if(userNameSelected){
         userNameSelected = false; 
         letters.clear();
        } else {
         //insert the strings to the database
        }
      }
    }
    if (gameState == "levelSelect") {             //if the music is not looping yet, it starts to play the background music, and activates the musicLooping boolean
      if (!musicLooping) {
        bgmusic.loop();
        musicLooping = true;
      }
      // dit zorgt ervoor dat de pointer kan bewegen
      //to the right
      if (keyCode == 68) {
        if (!press) {
          difficultyScaler++;
          press = true;
        }
      }
      if (keyCode != 68 && keyCode != 65) {
        if (press) {
          press = false;
        }
      }

      if (difficultyScaler > 4) {
        difficultyScaler = 4;
      }
      //to the left
      if (keyCode == 65) {
        if (!press) {
          difficultyScaler--;
          press = true;
        }
      }

      //location of the pointer determents the dificulty that you play on
      switch(difficultyScaler) {
      case 1:
        select = "easy";
        break;
      case 2:
        select = "balanced";
        break;
      case 3:
        select = "insane";
        break;
      case 4:
        select = "tutorial";
        break;
      default:
        difficultyScaler = 1;
        println("error in scaler");
        break;
      }
      //switch to playing state using the difficutly selected by the pointer after a (on the controler) or c (on keyboard) is pressed
      switch(select) {
      case "easy":
        if (keysPressed[67]) {
          easy = true;
          gameState = "play";
        }
        break;
      case "balanced":
        if (keysPressed[67]) {
          balanced = true;                                        
          gameState = "play";
        }
        break;
      case "insane":
        if (keysPressed[67]) {
          insane = true;                                        
          gameState = "play";
        }
        break;
      case "tutorial":
        if (keysPressed[67]) {
          tutorial = true;
          gameState = "tutorial";
        }
        break;

      default:
        println("play error");
        break;
      }
    }
    if (gameState == "play") {

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
    if (gameState == "gameOver") {                            
      bgmusic.stop();                               //if the gameState is 3, the background music is stopped, and musicLooping is deactivated
      musicLooping = false;
      if (keysPressed[ENTER]) {                     //if you press the ENTER key, it resets all the variables which directly impact gameplay, and reverts the gameState to 1, so you can start the game again
        gameState = "levelSelect";
        grid.gridClear();
        blockPlace.filledClear();
        blockPlace.blockCount = 0;
        for (int w = 0; w < 22; w++) {
          for (int h = 0; h<20; h++) {  
            score.scorePlus[w][h] = false;
          }
        }
        score.Score = 0;
      }
    }
    if (gameState == "tuturial") {
      if (tutorial) {
        image(gameT, 0, 0);
      }
    }
  }
}
