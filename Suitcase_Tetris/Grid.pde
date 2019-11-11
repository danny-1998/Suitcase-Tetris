class Grid {
  //By Danny Ha
  int w = 22;
  int h = 20;
  int q = 50;
  int [][] cells = new int[w][h];

  Grid() {
    for (int i = 0; i < w; i ++) {
      for (int j = 0; j < h; j ++) {
        cells[i][j] = 0;
        //        if(j>h-3 && i<w-1){
        //          cells[i][j] = color(23, 34, 189);
        //        }
      }
    }
  }
  void drawGrid() {
    stroke(120);
    pushMatrix();
    translate(350, 40);
    for (int i = 0; i <= w; i ++) {
      line(i*q, 0, i*q, h*q);
    }
    for (int j = 0; j <= h; j ++) {
      line(0, j*q, w*q, j*q);
    }

    stroke(80);
    for (int i = 0; i < w; i ++) {
      for (int j = 0; j < h; j ++) {
        if (cells[i][j] != 0) {
          fill(cells[i][j]);
          //fill(random(255),random(255),random(255));
          //DISCO PARTY CODE
          rect(i*q, j*q, q, q);
        }
      }
    }
    popMatrix();
  }

  void gridClear() {
    for (int i = 0; i<w; i++) {
      for (int o = 0; o<h; o++) {
        cells[i][o] = blockPlace.filled[i][o];
      }
    }
  }
}
