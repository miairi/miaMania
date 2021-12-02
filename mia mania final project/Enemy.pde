class Enemy {
  //class vars
  int x;
  int y;
  int w;
  int h;
  int xSpeed;
  int ySpeed;

  color c;

  //boundary vars
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  boolean isDead;

  //constructor
  Enemy(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    w = 20;
    h = 100;
    xSpeed = 5;
    ySpeed = 5;

    c = color (255);

    isDead = false;
  }

  ////FUNCTIONS

  //render enemy function
  void render() {
    fill(c);
    rect(x, y, w, h);
  }

  //move enemy function
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
      ySpeed = abs(ySpeed);
    }
    //left player box boundary
    if (x <= box.x) {
      xSpeed = abs(xSpeed);
    }
    //bottom player box boundary
    if (y >= box.y + box.w) {
      ySpeed = -abs(ySpeed);
    }
    //right player box boundary
    if (x >= box.x + box.w) {
      xSpeed = -abs(xSpeed);
    }
  }

  //set enemy boundaries
  void resetBoundaries() {
    topBound = y;
    bottomBound = y + w;
    leftBound = x;
    rightBound = x + w;
  }

  //collision detection -- kill with bullets
  void isHit (Bullet b1) {
    if (b1.topBound <= bottomBound) {
      if (b1.bottomBound >= topBound) {
        if (b1.leftBound <= rightBound) {
          if (b1.rightBound >= leftBound) {
            isDead = true;
          }
        }
      }
    }
  }
}
