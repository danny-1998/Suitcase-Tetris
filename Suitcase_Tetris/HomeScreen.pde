// by Kiano Wortel

class HomeScreen {
  boolean gameStart = false;
  boolean level = false;
  boolean e = false;
  boolean m = false;
  boolean h = false;




  void homeDraw() {
    if (gameStart == false) {
      fill (255, 174, 201);
      rect(0, 0, width, height);
    }

    if (level == true) {
      image(Level, 0, 0, width, height);
    }

    if (e == true) {
      fill(0, 255, 0);
      }
      if (m == true) {
      fill(0, 255, 255);
      }
      if (h == true) {
      fill(255, 0, 0);
      }
  }
}
