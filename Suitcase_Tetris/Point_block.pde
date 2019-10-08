// By Kiano Wortel

class PointBlock {
  /*diagram of how im coding this Point_Block in the grid:
   *                [0]
   *I mean, it kinda speaks for itself
   */

  int width0;
  int height0;

  PointBlock() {
    width0=6;
    height0=13;
  }

  void PointBlockDraw() {
    grid.cells[width0][height0] = 1;
  }
}
