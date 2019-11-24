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
      textMode(CENTER);
      fill(0);
      text("Press ENTER to continue", score.Textx, 3*(height/4));
      image(logo, 2*(width/7), height/4);
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
