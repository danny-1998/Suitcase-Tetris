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
      text ("hello welcome to the tutorial, press A", 10, 400);
    }

    if (part1 == true) {
      text ("try moving left (left arrow)", 10, 400);
    }

    if (part2 == true) {
      text ("wow look at you! now try moving right", 10, 400);
    }

    if (part3 == true) {
      text ("try rotating right with the right shoulder buttons", 10, 400);
    }

    if (part4 == true) {
      text ("cool!! now rotate left", 10, 400);
    }

    if (part5 == true) {
      drop = true;
      text ("the block takes a lot of time to drop", 10, 400);
      text ("hold down to fall faster", 10, 475);
    }

    if (part6 == true) {
      fill (0);
      text ("great!", 10, 400);
      text ("i think you got the hang of it", 10, 475);
      fill (0, 0, 255);
      text ("press A", 10, 550);
      //text ("or press start to go back to the difficulty selector", 10, 625);
    }
    
    if (part7 == true){
      fill (0);
      text ("place some blocks and then press Y", 10, 400);
      text ("trust me, just do it", 10, 475);
    }
    
    if (part8 == true) {
      text ("SURPRISE! you just cleared all of your blocks", 10, 400);
      text ("in this tutorial you can clear any time you want", 10, 475);
      text ("", 10, 550);
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
    
    if (keysPressed[32]) {
      grid.gridClear();
      blockPlace.filledClear();
      blockPlace.uwu = 0;
    }
  }
}
