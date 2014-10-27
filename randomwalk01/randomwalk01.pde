int stepSize = 20;
float pointSize = 2.5;

int x;
int y;

void setup() {
  size(300, 600);

  x = round(random(width));
  y = round(random(height));
}

void draw() {
  strokeWeight(random(pointSize / 4, pointSize));
  point(x, y);
  
  x = updatePoint(x);
  y = updatePoint(y);
}

int updatePoint(int position) {
  
  int offset;
  float leftOrRight = random(-1, 1);

  if (leftOrRight < 0) {
    offset = stepSize;
  }
  else {
    offset = -stepSize;
  }
  
  return position + offset;
}

