//making my class Aimbar
class MovingAimbar {
  //class variables
  float x;
  float y;
  float w;
  float h;

  color c;

  int xSpeed;
  int ySpeed;

  //aimbar colors booleans
  boolean isRed;
  boolean isOrange;
  boolean isYellow;
  boolean isGreen;

  boolean isStopped;

  //boundary vars
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  //make constructor function
  MovingAimbar(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    w = 15;
    h = 145;
    xSpeed = 10;
    ySpeed = 10;

    c = color(255);

    isRed = false;
    isOrange = false;
    isYellow = false;
    isGreen = false;

    isStopped = false;
  }

  ////FUNCTIONS

  //have box render
  void render() {
    fill(c);
    rect(x, y, w, h);
  }

  //move bar function
  void move() {
    x = x + xSpeed;
    if (y >= box.y) {
      y = y - ySpeed;
    }
    if (y <= box.y + box.w) {
      y = y + ySpeed;
    }
  }

  //player box detection
  void wallDetect() {
    //top player box boundary
    if (y <= box.y) {
      player.y = player.y + 1;
      ySpeed = abs(ySpeed);
    }
    //left player box boundary
    if (x <= box.x) {
      player.x = player.x + 10;
      xSpeed = abs(xSpeed);
    }
    //bottom player box boundary
    if (y >= box.y + box.w) {
      player.y = player.y - 1;
      ySpeed = -abs(ySpeed);
    }
    //right player box boundary
    if (x >= box.x + box.w) {
      player.x = player.x - player.w;
      xSpeed = -abs(xSpeed);
    }
  }

  //set bar boundaries
  void resetBoundaries() {
    topBound = y;
    bottomBound = y + h;
    leftBound = x;
    rightBound = x + w;
  }
}
