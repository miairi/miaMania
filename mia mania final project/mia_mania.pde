////GLOBAL VARS

////**sound**////
import processing.sound.*;

//declaring my sound vars
SoundFile backgroundMusic;
SoundFile attackSound;

//state var
int state;

////**player**////
//make the box the player should be in
PlayerBox box;

//make the player
Player player;

////**enemy**////
//make boss mia
BossMia bossMia;

//make some buttons
Button fightButton;

//make the bullets
Bullet bullets;

//make my bullet array list
ArrayList<Bullet> bulletList;

//make the enemies
Enemy anEnemy;

////**aimbar**////
//make the aimbar
Aimbar theAimbar;
Aimbar redAimbar;
Aimbar orangeAimbar;
Aimbar yellowAimbar;
Aimbar greenAimbar;

MovingAimbar theMovingAimbar;

//make my enemy array list
ArrayList<Enemy> enemyList;

////**animation**////
//make my intro animation
Animation introAnimation;

//make an array of images to animate the intro, make the array have 4 slots
PImage[] intro = new PImage[4];

//make my starting screen mia animation
Animation miaHeadAnimation;

//make an array of images to animate the starting screen mia, make the array have 3 slots
PImage[] miaHead = new PImage[3];

//make my boss mia animation
Animation idleMiaAnimation;

//make an array of images to animate idle boss mia make the array have 5 slots
PImage[] idleMia = new PImage[5];

//make my pencil animation
Animation pencilAnimation;

//make an array of images to animate the pencil, make the array have 6 slots
PImage[] pencil = new PImage[6];

//make my player hurt animation
Animation hurtAnimation;

//make an array of images to animate the player hurting, make the array have 5 slots
PImage[] playerHurt = new PImage[5];

//make my loser animation
Animation loserAnimation;

//make an array of images to animate loser, make the array have 5 slots
PImage[] loser = new PImage[5];

//make my winner animation
Animation winnerAnimation;

//make an array of images to animate winner, make the array have 6 slots
PImage[] winner = new PImage[6];

void setup() {

  //set window size
  size (1430, 800);

  //set up bg music
  backgroundMusic = new SoundFile(this, "meltdown.wav");
  //change the volume of bg music
  backgroundMusic.amp(0.5);

  //call sound file
  attackSound = new SoundFile(this, "attack.wav");

  ////**state setup**////

  //state var
  state = 0;

  ////**playerbox setup**////

  //initialize player box
  box = new PlayerBox(520, 290, 400, color(#FFFFFF));

  ////**player setup**////

  //initialize player
  player = new Player(box.x + box.w/2, box.y + box.w/2, 25, 5, color(#FFFFFF));

  //initialize movement booleans
  player. isPlayerUp = false;
  player. isPlayerDown = false;

  ////**bullet setup**////

  //initialize my bullet array list
  bulletList = new ArrayList<Bullet>();

  ////**enemy setup**////

  //initialize my enemy list
  enemyList = new ArrayList<Enemy>();

  //manually add first enemy to my array list
  enemyList.add(new Enemy(width/2 + 150, height - 450));

  //manually add second enemy to my array list
  enemyList.add(new Enemy(width/2 + 100, height - 250));

  ////**button setup**////

  //initialize buttons
  fightButton = new Button(box.x + 50, box.y + 425);

  ////**boss setup**////

  bossMia = new BossMia(box.x + 145, box.y - 200);

  ////**aimbar setup**////

  //initialize aimbar
  theAimbar = new Aimbar(width/2.62, height/1.90, 350, color(0));
  redAimbar = new Aimbar(width/2.62, height/1.90, 175, color(#F23636));
  orangeAimbar = new Aimbar(width/2, height/1.90, 100, color(#F29436));
  yellowAimbar = new Aimbar(width/1.8, height/1.90, 60, color(#F2F236));
  greenAimbar = new Aimbar(width/1.68, height/1.90, 43, color(#83F236));

  theMovingAimbar = new MovingAimbar(width/1.68, height/2);

  ////**animation**////

  //fill the array with images from the data folder
  for (int i = 0; i<intro.length; i = i + 1) {
    intro[i] = loadImage("intro"+i+".png");
  }

  //initilize intro animation
  introAnimation = new Animation(intro, 0.01, 1.5);

  //fill the array with images from the data folder
  for (int i = 0; i<miaHead.length; i = i + 1) {
    miaHead[i] = loadImage("miaHead"+i+".png");
  }

  //initilize mia head animation
  miaHeadAnimation = new Animation(miaHead, 0.1, 1.5);

  //fill the array with images from the data folder
  for (int i = 0; i<pencil.length; i = i + 1) {
    pencil[i] = loadImage("pencil"+i+".png");
  }

  //initilize pencil animation
  pencilAnimation = new Animation(pencil, 0.01, 0.5);

  //fill the array with images from the data folder
  for (int i = 0; i<idleMia.length; i = i + 1) {
    idleMia[i] = loadImage("idleMia"+i+".png");
  }

  //initilize idle mia animation
  idleMiaAnimation = new Animation(idleMia, 0.07, 0.5);

  //fill the array with images from the data folder
  for (int i = 0; i<playerHurt.length; i = i + 1) {
    playerHurt[i] = loadImage("playerHurt"+i+".png");
  }

  //initilize player hurting animation
  hurtAnimation = new Animation(playerHurt, 0.1, 0.3);

  //fill the array with images from the data folder
  for (int i = 0; i<loser.length; i = i + 1) {
    loser[i] = loadImage("loser"+i+".png");
  }

  //initilize loser animation
  loserAnimation = new Animation(loser, 0.1, 1.5);

  //fill the array with images from the data folder
  for (int i = 0; i<winner.length; i = i + 1) {
    winner[i] = loadImage("winner"+i+".png");
  }

  //initilize winner animation
  winnerAnimation = new Animation(winner, 0.1, 1.5);
}

//***************************************************************************//

void draw() {
  //set bg color
  background (0);

  //if the background music is not already playing, play it
  if (backgroundMusic.isPlaying() == false) {
    backgroundMusic.play();
  }

  ////**state draw**////

  //my finite state machine
  switch(state) {

    ////CASE 1

    //in case 0 make the start screen
  case 0:
    //add miaHead animations/text
    PFont font;
    font = createFont ("UndertaleFont.otf", 128);
    textFont(font, 128);
    text("Mia Mania", 50, 160);

    textSize(75);
    fill(#FCFEFF);
    text("press 'm' to start!", width/2 - 460, height/2 + 350);

    miaHeadAnimation.display(width/2, height/2 + 25);
    miaHeadAnimation.isAnimating = true;
    break;

    ////CASE 2

    //in case 1 run intro
  case 1:
    //add story/intro
    fill(#FCFEFF);
    introAnimation.display(width/2, height/2);
    introAnimation.isAnimating = true;

    textSize(35);
    fill(#FCFEFF);
    text("press 'm' to skip intro!", width/2 - 345, height/2 - 330);
    break;

    ////CASE 3

    //attack case
  case 2:
    //game instructions
    textSize(20);
    fill(#FCFEFF);
    text(" - use the arrow keys to move!", 40, 150);
    textSize(20);
    fill(#FCFEFF);
    text(" - use the spacebar to shoot!", 40, 200);
    textSize(20);
    fill(#FCFEFF);
    text(" < get my HP down to zero to win!", 800, 170);

    //render player box
    box. render();

    //render boss mia
    idleMiaAnimation.display(bossMia.x + 50, bossMia.y + 90);
    idleMiaAnimation.isAnimating = true;

    ////**player draw**////

    //draw my player hurting animation
    hurtAnimation.display(player.x + 15, player.y + 15);

    //have player move
    player. move();

    //add player/mia HP
    player.displayHealth();
    bossMia.displayHealth();

    //if player dies
    player.playerDeath();

    //if player wins
    bossMia.playerWins();

    //player boundaries
    //top player box boundary
    if (player.y <= box.y) {
      player.y = player.y + 10;
    }
    //left player box boundary
    if (player.x <= box.x) {
      player.x = player.x + 10;
    }
    //bottom player box boundary
    if (player.y >= box.y + box.w) {
      player.y = player.y - 10;
    }
    //right player box boundary
    if (player.x >= box.x + box.w) {
      player.x = player.x - 10;
    }

    //reset player boundaries
    player.resetBoundaries();

    ////**enemy and bullet draw**////

    //my enhanced for loop to go through my entire bullet and enemy array lists
    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
      for (Enemy anEnemy : enemyList) {
        anEnemy.isHit(aBullet);
      }
      aBullet.resetBoundaries();
    }

    //render enemies
    for (Enemy anEnemy : enemyList) {
      pencilAnimation.display(anEnemy.x + 10, anEnemy.y + 50);
      pencilAnimation.isAnimating = true;
    }
    //move enemies
    for (Enemy anEnemy : enemyList) {
      anEnemy.move();
      anEnemy.wallDetect();
    }
    //reset enemy boundaries
    for (Enemy anEnemy : enemyList) {
      player.playerWasHit(anEnemy);
      anEnemy.resetBoundaries();
    }

    //for loop that will remove dead enemies
    for (int i=enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);
      }
    }

    //render buttons
    fightButton.render();
    textSize(20);
    fill(#FCFEFF);
    text("FIGHT", box.x + 57, box.y + 457);
    fightButton.isButtonPressed();

    //change state when button is pressed
    if (fightButton.isPressed == true) {
      state = 3;
    }
    break;

    ////CASE 3

    //fight case
  case 3:
    //game instructions
    textSize(20);
    fill(#FCFEFF);
    text(" - press 's' on green!", 215, 175);
    textSize(20);
    fill(#FCFEFF);
    text(" < get my HP down to zero to win!", 800, 170);

    //render player box
    box. render();
    //render boss mia
    idleMiaAnimation.display(bossMia.x + 50, bossMia.y + 90);
    idleMiaAnimation.isAnimating = true;

    //render aimbar
    theAimbar.render();
    redAimbar.render();
    orangeAimbar.render();
    yellowAimbar.render();
    greenAimbar.render();

    theMovingAimbar.render();
    theMovingAimbar.move();
    theMovingAimbar.wallDetect();
    theMovingAimbar.resetBoundaries();
    //theMovingAimbar.isStopped = false;


    //render buttons
    fightButton.render();
    textSize(20);
    fill(#FCFEFF);
    text("FIGHT", box.x + 57, box.y + 457);

    if (fightButton.isPressed == true) {
      //theMovingAimbar.isStopped = false;
      state = 3;
    }

    //add player/mia HP
    player.displayHealth();
    bossMia.displayHealth();

    //if player dies
    player.playerDeath();

    //if player wins
    bossMia.playerWins();
    break;

    ////CASE 4

    //losing screen for the player
  case 4:
    //if player's HP reaches zero, player loses
    font = createFont ("UndertaleFont.otf", 128);
    textFont(font, 128);
    text("you lose!", 200, 160);

    loserAnimation.display(width/2, height/2 + 20);
    loserAnimation.isAnimating = true;

    textSize(50);
    fill(#FCFEFF);
    text("press 'r' to try again!", width/2 - 460, height/2 + 350);
    break;

    ////CASE 5

    //winning screen for the player
  case 5:
    //if mia's HP reaches zero, player wins
    font = createFont ("UndertaleFont.otf", 128);
    textFont(font, 128);
    text("you win!", 250, 160);

    winnerAnimation.display(width/2, height/2 + 20);
    winnerAnimation.isAnimating = true;

    textSize(50);
    fill(#FCFEFF);
    text("press 'r' to play again!", width/2 - 460, height/2 + 350);
    break;
  }
}

//********************************************************************//

void keyPressed() {
  //if space key is pressed, shoot bullet
  if (key == ' ') {
    bulletList.add(new Bullet(player.rightBound, player.y + 15));
    attackSound. play();
  }
  //if the key is coded
  if (key == CODED) {
    //when arrow keys are pressed, move the player
    //if the key code is UP
    if (keyCode == UP) {
      player. isPlayerUp = true;
    }
    //if the key code is DOWN
    if (keyCode == DOWN) {
      player. isPlayerDown = true;
    }
    //if the key code is LEFT
    if (keyCode == LEFT) {
      player. isPlayerLeft = true;
    }
    //if the key code is RIGHT
    if (keyCode == RIGHT) {
      player. isPlayerRight = true;
    }
  }
  //if 's' is pressed in attack sequence (case 3), stop moving aimbar
  if (key == 's') {
    //theMovingAimbar.isStopped = true;
    //check collision detection
    if (redAimbar.leftBound <= theMovingAimbar.rightBound) {
      if (redAimbar.rightBound >= theMovingAimbar.leftBound) {
        theMovingAimbar.isRed = true;
        theMovingAimbar.xSpeed = 0;
        bossMia.bossMiaHP = bossMia.bossMiaHP - 4;
        println("mia HP decreases by 4");
        //make enemies
        //manually add first enemy to my array list
        enemyList.add(new Enemy(width/2 + 150, height - 450));

        //manually add second enemy to my array list
        enemyList.add(new Enemy(width/2 + 100, height - 250));
        state = 2;
      }
    }
    //theMovingAimbar.isStopped = true;
    //check collision detection
    if (orangeAimbar.leftBound <= theMovingAimbar.rightBound) {
      if (orangeAimbar.rightBound >= theMovingAimbar.leftBound) {
        theMovingAimbar.isRed = true;
        theMovingAimbar.xSpeed = 0;
        bossMia.bossMiaHP = bossMia.bossMiaHP - 6;
        println("mia HP decreases by 6");
        //make enemies
        //manually add first enemy to my array list
        enemyList.add(new Enemy(width/2 + 150, height - 450));

        //manually add second enemy to my array list
        enemyList.add(new Enemy(width/2 + 100, height - 250));
        state = 2;
      }
    }
    //theMovingAimbar.isStopped = true;
    //check collision detection
    if (yellowAimbar.leftBound <= theMovingAimbar.rightBound) {
      if (yellowAimbar.rightBound >= theMovingAimbar.leftBound) {
        theMovingAimbar.isRed = true;
        theMovingAimbar.xSpeed = 0;
        bossMia.bossMiaHP = bossMia.bossMiaHP - 8;
        println("mia HP decreases by 8");
        //manually add first enemy to my array list
        enemyList.add(new Enemy(width/2 + 150, height - 450));

        //manually add second enemy to my array list
        enemyList.add(new Enemy(width/2 + 100, height - 250));
        state = 2;
      }
    }
    //theMovingAimbar.isStopped = true;
    //check collision detection
    if (greenAimbar.leftBound <= theMovingAimbar.rightBound) {
      if (greenAimbar.rightBound >= theMovingAimbar.leftBound) {
        theMovingAimbar.isRed = true;
        theMovingAimbar.xSpeed = 0;
        bossMia.bossMiaHP = bossMia.bossMiaHP - 10;
        println("mia HP decreases by 10");
        //manually add first enemy to my array list
        enemyList.add(new Enemy(width/2 + 150, height - 450));

        //manually add second enemy to my array list
        enemyList.add(new Enemy(width/2 + 100, height - 250));
        state = 2;
      }
    }
  }

  //if 'r' is pressed, reset game
  if (key == 'r') {
    setup();
  }
  //if 'm' is pressed, increase state
  if (key == 'm') {
    //have state increase
    state = state + 1;
  }
}

//******************************************************************//

void keyReleased() {
  //if the key is coded
  if (key == CODED) {
    //when arrow keys are released, have the player stop moving
    //if the key code is UP
    if (keyCode == UP) {
      player. isPlayerUp = false;
    }
    //if the key code is DOWN
    if (keyCode == DOWN) {
      player. isPlayerDown = false;
    }
    //if the key code is LEFT
    if (keyCode == LEFT) {
      player. isPlayerLeft = false;
    }
    //if the key code is RIGHT
    if (keyCode == RIGHT) {
      player. isPlayerRight = false;
    }
  }
  if (key == 's') {
    //theMovingAimbar.isStopped=false;
  }
}
