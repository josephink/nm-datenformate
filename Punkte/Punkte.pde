int appWidth = displayWidth;

int stepSize = 10;
float pointSize = 100;
int x;
int y;

void setup() {
  size(displayWidth, displayHeight);
  colorMode (RGB);
  background(200);

  x = round(random(width));
  y = round(random(height));
}
void draw() {
  strokeWeight (random(pointSize / 4, pointSize));
  stroke(130, 70, 162, randomColor());
  point(x, y);
  println(frameCount); 

  x = updatePoint(x, width);
  y = updatePoint(y, height);
  
  }
  void keyReleased() {
    saveFrame("export/bildname #####.jpg"); 
}

int randomColor() {
 return round(random(255));
}
/*
* position: position auf der achse
 * maximum: maximum der achse
 */
int updatePoint(int position, int maximum) {
  int offset;
  float leftOrRight = random(-1, 1);
  int newPosition;
  if (leftOrRight < 0) {
    offset = stepSize;
  } else {
    offset = -stepSize;
  }
  newPosition = position + offset;
  boolean newPositionIsOnStage = isOnStage(newPosition, maximum);
  // die neue position ist innerhalb der bühne
  if (newPositionIsOnStage) {
    return newPosition;
  } else {
    // außerhalb der bühne -> erneut berechnen
    return updatePoint(position, maximum);
  }
}
boolean isOnStage (int position, int maximum) {
  // position ist kleiner als 0 oder größer-gleich maximum
  if (position < 0 || position >= maximum) {
    return false;
  } else {
    return true;
  }
}

