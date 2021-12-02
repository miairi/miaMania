class Bullet {
  //class vars
  float x;
  float y;
  float d;

  color c;

  float speed;

  //boundary vars
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  //constructor
  Bullet(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    d = 5;
    c = color(255);
    speed = 10;
  }

  ////FUNCTIONS

  //render bullet function
  void render() {
    fill(c);
    circle(x, y, d);
  }

  //have bullet move
  void move() {
    x = x + speed;
  }
  //set player boundaries
  void resetBoundaries() {
    topBound = y;
    bottomBound = y + d;
    leftBound = x;
    rightBound = x + d;
  }
}
