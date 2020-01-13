class Tutorial {
  boolean tutorialStart = true;
  boolean part1 = false;
  boolean part2 = false;
  boolean part3 = false;
  boolean part4 = false;
  boolean part5 = false;
  boolean part6 = false;
  boolean part7 = false;
  boolean part8 = false;
  boolean part9 = false;
  boolean part10 = false;
  boolean drop = false;

  void draw() {
    textSize (50);
    grid.drawGrid();
    blockPlace.fills();
    grid.gridClear();
    currentBlock.newBlock();
    currentBlock.currentBlockDraw();
    blockPlace.check();
    currentBlock.currentBlockControlls();
    control.controllsV3();
    if (grid != null) {
      grid.drawGrid();
      now = millis();
      if (drop) { 
        if (gameOn) {
          if (now - currentTime > dt1) {
            currentTime = now;
            currentBlock.oneStepDown();
            beep.play();
            //Dit is Easy difficulty, Easy difficulty gaat om de 1000 milliseconde 1 blokje omlaag.
          }
        }
      }
    }
    if (tutorialStart == true) {
      fill (0, 200, 0 );
      text ("hello welcome to the \ntutorial, press A", 10, 350);
    }

    if (part1 == true) {
      text ("try moving left \n(left arrow)", 10, 350);
    }

    if (part2 == true) {
      text ("wow look at you! \nnow try moving right", 10, 350);
    }

    if (part3 == true) {
      text ("try rotating right \nwith the X button", 10, 350);
    }

    if (part4 == true) {
      text ("cool!! now rotate left \nwith the UP button", 10, 350);
    }

    if (part5 == true) {
      drop = true;
      text ("the block takes a lot \nof time to drop", 10, 350);
      text ("hold down to fall faster", 10, 475);
    }

    if (part6 == true) {
      fill (0, 200, 0);
      text ("great! \ni think you got the hang of it", 10, 350);
      fill (0, 0, 255);
      text ("press A", 10, 550);
      //text ("or press start to go back to the difficulty selector", 10, 625);
    }

    if (part7 == true) {
      fill (0, 200, 0);
      text ("place some blocks \nand then press Y", 10, 350);
      text ("trust me, just do it", 10, 475);
    }

    if (part8 == true) {
      fill (0, 200, 0);
      text ("SURPRISE! you just \ncleared all of your \nblocks \nin this tutorial you \ncan clear any time \nyou want", 10, 350);
      fill (0, 0, 255);
      text ("press A", 10, 725);
    }

    if (part9 == true) {
      fill (0, 200, 0);
      text ("in the real game you \ncan only clear once \nyou've filled a certain \npercentage of the \nsuitcase", 10, 350);
      fill (0, 0, 255);
      text ("press A", 10, 725);
    }
    if (part10 == true) {
      fill (0, 200, 0);
      text ("this is the end.. \nof the tutorial :D \nyou can stay and \nparactise a bit more \nor press B to go \nback to difficulty selector", 10, 350);
    }

    if (keysPressed[67] && tutorialStart == true) {
      tutorialStart = false;
      part1 = true;
    }

    if (keysPressed[65] && part1 == true) {
      part1 = false;
      part2 = true;
    }

    if (keysPressed[68] && part2 == true) {
      part2 = false;
      part3 = true;
    }

    if (keysPressed[87] && part3 == true) {
      part3 = false;
      part4 = true;
    }

    if (keysPressed[90] && part4 == true) {
      part4 = false;
      part5 = true;
    }
    if (keysPressed[83] && part5 ==  true) {
      part5 = false;
      part6 = true;
    }

    if (keysPressed[67] && part6 == true) {
      part6 = false;
      part7 = true;
    }

    if (keysPressed[32] && part7 == true) {
      part7 = false;
      part8 = true;
    }

    if (keysPressed[67] && part8 == true) {
      part8 = false;
      part9 = true;
    }

    if (keysPressed[67] && part9 == true) {
      part9 = false;
      part10 = true;
    }

    if (part10== true && keysPressed[10]) {
      part10=false;
      tutorialStart=true;
      currentBlock.currentBlockX=11;
      currentBlock.currentBlockY=1;
      home.gameState = 1;
      grid.gridClear();
      blockPlace.filledClear();
      blockPlace.uwu = 0;
    }

    if (keysPressed[32]) {
      grid.gridClear();
      blockPlace.filledClear();
      blockPlace.uwu = 0;
    }
  }
}
