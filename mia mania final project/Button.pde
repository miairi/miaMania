//making my new class button
class Button {
  //class variables
  float x;
  float y;
  int w;
  int h;

  color c;

  boolean isPressed;

  //make constructor function
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    w = 100;
    h = 50;
    c = color (#000000);
    isPressed = false;
  }

  //function to render buttons
  void render() {
    fill(c);
    stroke (color (#FFFFFF));
    rect(x, y, w, h);
  }
  //function that determines whether a particular button is pressed
  void isButtonPressed() {
    if (isPressed == true) {
      isPressed = false;
    }
    if (mousePressed) {
      if (mouseX >= x) {
        if (mouseX <= x + w) {
          if (mouseY >= y) {
            if (mouseY <= y + h) {
              isPressed = true;
            }
          }
        }
      }
    }
  }
}
