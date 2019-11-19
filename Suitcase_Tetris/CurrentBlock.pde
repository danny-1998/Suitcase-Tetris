class CurrentBlock {
  float blockPicker;
  int currentBlockX, currentBlockY;
  int minX, maxX;
  boolean onEdgeLeft, onEdgeRight;
  boolean wallClockwise, wallAnticlockwise;
  boolean newBlock = false;
  CurrentBlock() {
    currentBlockX = 11;
    currentBlockY = 1;
    blockPicker = 1;
    newBlock = true;
  }

  void newBlock() {
    if (newBlock) {
      currentBlockY = 1;
      currentBlockX = 11;
      blockPicker = ceil(random(9));
      newBlock = false;
      println(blockPicker);
    }
  }
  void currentBlockDraw() {
    if (blockPicker==1) {
      tBlock.TBlockDraw();
    }
    if (blockPicker==2) {
      oBlock.OBlockDraw();
    }
    if (blockPicker == 3) {
      pointBlock.PointBlockDraw();
    }
    if (blockPicker == 4) {
      sBlock.SBlockDraw();
    }
    if (blockPicker == 5) {
      zBlock.ZBlockDraw();
    }
    if (blockPicker == 6) {
      jBlock.JBlockDraw();
    }
    if (blockPicker == 7) {
      lBlock.LblockDraw();
    }
    if (blockPicker == 8) {
      commaBlock.CommaBlockDraw();
    }
    if (blockPicker == 9) {
      iBlock.IBlockDraw();
    }
  }

  void currentBlockControlls() {
    if (blockPicker==1) { 
      minX = tBlock.minX;
      maxX = tBlock.maxX;
      onEdgeLeft = tBlock.onEdgeLeft;
      onEdgeRight = tBlock.onEdgeRight;
      wallClockwise = tBlock.wallClockwise;
      wallAnticlockwise = tBlock.wallAnticlockwise;
    }
    if (blockPicker==2) {
      minX = oBlock.minX;
      maxX = oBlock.maxX;
      onEdgeLeft = false;
      onEdgeRight = false;
      wallClockwise = false;
      wallAnticlockwise = false;
    }
    if (blockPicker==3) {
      minX = pointBlock.minX;
      maxX = pointBlock.maxX;
      onEdgeLeft = false;
      onEdgeRight = false;
      wallClockwise = false;
      wallAnticlockwise = false;
      ;
    }
    if (blockPicker == 4) {
      minX = sBlock.minX;
      maxX = sBlock.maxX;
      onEdgeLeft = sBlock.onEdgeLeft;
      onEdgeRight = sBlock.onEdgeRight;
      wallClockwise = sBlock.wallClockwise;
      wallAnticlockwise = sBlock.wallAnticlockwise;
    }
    if (blockPicker == 5) {
      minX = zBlock.minX;
      maxX = zBlock.maxX;
      onEdgeLeft = zBlock.onEdgeLeft;
      onEdgeRight = zBlock.onEdgeRight;
      wallClockwise = zBlock.wallClockwise;
      wallAnticlockwise = zBlock.wallAnticlockwise;
    }
    if (blockPicker == 6) {
      minX = jBlock.minX;
      maxX = jBlock.maxX;
      onEdgeLeft = jBlock.onEdgeLeft;
      onEdgeRight = jBlock.onEdgeRight;
      wallClockwise = jBlock.wallClockwise;
      wallAnticlockwise = jBlock.wallAnticlockwise;
    }
    if (blockPicker == 7) {
      minX = lBlock.minX;
      maxX = lBlock.maxX;
      onEdgeLeft = lBlock.onEdgeLeft;
      onEdgeRight = lBlock.onEdgeRight;
    }
    if (blockPicker == 8) {
      minX = commaBlock.minX;
      maxX = commaBlock.maxX;
      onEdgeLeft = commaBlock.onEdgeLeft;
      onEdgeRight = commaBlock.onEdgeRight;
    }
    if (blockPicker == 9) {
      minX = iBlock.minX;
      maxX = iBlock.maxX;
      onEdgeLeft = iBlock.onEdgeLeft;
      onEdgeRight = iBlock.onEdgeRight;
    }
  }

  void oneStepDown() { 
    currentBlockY += 1;
  }
}
