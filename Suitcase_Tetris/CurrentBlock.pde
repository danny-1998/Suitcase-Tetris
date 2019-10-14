class CurrentBlock {
  float blockPicker;
  int currentBlockX, currentBlockY;
  int minX, maxX;
  boolean onEdgeLeft, onEdgeRight;
  CurrentBlock() {
    currentBlockX = 11;
    currentBlockY = 1;
    blockPicker = 1;
  }

  void currentBlockDraw() {
    if (blockPicker==1) {
      tBlock.TBlockDraw();
    }
    if (blockPicker==2) {
      oBlock.OBlockDraw();
    }
    if(blockPicker == 3){
     pointBlock.PointBlockDraw(); 
    }
    if(blockPicker == 4){
     sBlock.SBlockDraw(); 
    }
  }

  void currentBlockControlls() {
    if (blockPicker==1) { 
      minX = tBlock.minX;
      maxX = tBlock.maxX;
      onEdgeLeft = tBlock.onEdgeLeft;
      onEdgeRight = tBlock.onEdgeRight;
    }
    if(blockPicker==2){
     minX = oBlock.minX;
     maxX = oBlock.maxX;
     onEdgeLeft = false;
     onEdgeRight = false;
    }
    if(blockPicker==3){
     minX = pointBlock.minX;
     maxX = pointBlock.maxX;
     onEdgeLeft = false;
     onEdgeRight = false;
    }
    if(blockPicker == 4){
     minX = sBlock.minX;
     maxX = sBlock.maxX;
     onEdgeLeft = sBlock.onEdgeLeft;
     onEdgeRight = sBlock.onEdgeRight;
    }
  }
}
