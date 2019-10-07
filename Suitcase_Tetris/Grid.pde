class Grid {
  int w = 40;
  int h = 40;
  int q = 20;
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
    translate(160, 40);
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
          rect(i*q, j*q, q, q);
        }
      }
    }
    popMatrix();
  }
}
