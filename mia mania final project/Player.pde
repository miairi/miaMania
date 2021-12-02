//making my player class
class Player {
  //class variables
  float x;
  float y;
  float w;

  //movement booleans
  boolean isPlayerUp;
  boolean isPlayerDown;
  boolean isPlayerLeft;
  boolean isPlayerRight;
  int playerSpeed;

  boolean isPlayerDead;

  int playerHP;

  color c;

  ////player hitbox vars
  //int playerTop;
  //int playerBottom;
  //int playerRight;
  //int playerLeft;

  //boundary vars
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  //make constructor function
  Player(float tempX, float tempY, float tempW, int tempPlayerSpeed, color tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    playerSpeed = tempPlayerSpeed;
    c = tempC;
    playerHP = 20;
    isPlayerDead = false;
  }

  ////FUNCTIONS

  //render player function
  void render() {
    fill(c);
    rect(x, y, w, w);
  }

  //have player move
  void move() {
    if (isPlayerUp == true && y >= 0) {
      y = y - playerSpeed;
    }
    if (isPlayerDown == true && y <= height - w) {
      y = y + playerSpeed;
    }
    if (isPlayerLeft == true && x >= 0) {
      x = x - playerSpeed;
    }
    if (isPlayerRight == true && x <= width - w) {
      x = x + playerSpeed;
    }
  }

  //set player boundaries
  void resetBoundaries() {
    topBound = y;
    bottomBound = y + w;
    leftBound = x;
    rightBound = x + w;
  }

  //collision detection between enemy and player
  void playerWasHit (Enemy anEnemy) {
    if (anEnemy.topBound <= bottomBound) {

      if (anEnemy.bottomBound >= topBound) {

        if (anEnemy.leftBound <= rightBound) {

          if (anEnemy.rightBound >= leftBound) {
            hurtAnimation.isAnimating = true;
            playerHP = playerHP - 2;
          }
        }
      }
    }
  }
  
  //display player HP
  void displayHealth() {
    textSize(17);
    fill(#FCFEFF);
    text("player HP - ", 700, 750);
    text(playerHP, 870, 750);
  }

  //change state if player's HP is zero
  void playerDeath() {
    if (playerHP <= 0) {
      isPlayerDead = true;
      state = 4;
    }
  }
}
