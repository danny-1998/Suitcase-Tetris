class Location{
  //By Yves Prinz
  /* Deze class houd de positie en oriëntatie van de CurrentBlock bij als deze iets onder zich raakt, de bodem  of een ander blok.
  vervolgens slaat het die informatie op zodat dit blok ook getekend blijft,
  en geeft een signaal aan de CurrentBlock dat deze een nieuw blok mag maken.
  */
  
  void draw(){
    if (currentBlock.blockPicker == 1){// t-block
      if(tBlock.maxY >= grid.h){
        println("hier is de bodem");
       noLoop(); 
      }
    }
    if (currentBlock.blockPicker == 2){// o-block
      if(oBlock.maxY >= grid.h){
        println("hier is de bodem");
       noLoop(); 
      }
    }
    if (currentBlock.blockPicker == 3){// point-block
      if(pointBlock.maxY >= grid.h){
        println("hier is de bodem");
       noLoop(); 
      }
    }
    if (currentBlock.blockPicker == 4){// s-block
      if(sBlock.maxY >= grid.h){
        println("hier is de bodem");
       noLoop(); 
      }
    }
    
  }
}
