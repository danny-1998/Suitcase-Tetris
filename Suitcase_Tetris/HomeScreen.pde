// by Kiano Wortel

class HomeScreen {
  // deze class bevat het hoofd menu en een temporary level/difficulty select
  boolean gameStart = false;
  boolean level = false;
  boolean e = false;
  boolean m = false;
  boolean h = false;




  void homeDraw() {
    // gameStart houdt in dat de game bezig is (er zijn blokken die vallen)
    if (gameStart == false) {
      fill (255, 174, 201);
      rect(0, 0, width, height);
      textMode(CENTER);
      fill(0);
      text("Press START to continue", score.Textx, 3*(height/4));
      spriteSheet.update();
      spriteSheet.draw(2*(width/7), height/4);
      //image(logo, 2*(width/7), height/4);
    }
    // temporary level select tool
    if (level == true) {
      image(Level, 0, 0, width, height);
    }
    // e = easy, m = medium, h = hard. dit verandert de kleur van de blokken: e=groen m=blauw h=rood
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
