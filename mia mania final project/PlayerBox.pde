//making my class player box
class PlayerBox {
  //class variables
  int x;
  int y;
  float w;

  color c;

  //make constructor function
  PlayerBox(int tempX, int tempY, float tempW, color tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    c = tempC;
  }

  ////FUNCTIONS

  //have box render
  void render() {
    stroke(c);
    fill(0);
    rect(x, y, w, w);
  }
}
