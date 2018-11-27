int centerX;
int centerY;
boolean displayText = true;
boolean looping = false;

int size = 1000;
int seedSize = 10;
int numberOfSeeds = 1000;

// Phi = 0.61803398875
// e = 2.71828182846
float ratio = 0;

float ratioChange = 0.00001;
float ratioChangeIncrement = 0.00001;

float distance = size / numberOfSeeds;


void setup() {
  fullScreen();
  frameRate(30);
  noCursor();
  noStroke();
  textSize(30);
  if (!looping) {
    noLoop();
  }
  fill(255, 200, 0);
  centerX = width / 2;
  centerY = height / 2;
}

void draw() {
  background(20);
  placeSeeds();
  writeText();
  ratio += ratioChange;
}

void placeSeeds() {
  float angle = -90;
  float radius = distance;
  for (int i = 0; i < numberOfSeeds; i++) {
    placeSeed(angle, radius);
    angle += (360 * ratio) % 360;
    radius += distance;
  }
}

void placeSeed(float angle, float radius) {
  ellipse(
    centerX + cos(radians(angle)) * radius, 
    centerY + sin(radians(angle)) * radius, 
    seedSize, seedSize);
}

void writeText() {
  if (displayText) {
    fill(200);
    text(String.format("%.5f", ratio), 30, 50);
    fill(255, 200, 0);
  }
}

void keyPressed() {
  if (key == 't') {
    displayText = !displayText;
  } 
  if (key == ' ') {
    if (looping) {
      noLoop();
    } else {
      loop();
    }
    looping = !looping;
  } else if (keyCode == UP) {
    ratioChange += ratioChangeIncrement;
  } else if (keyCode == DOWN) {
    ratioChange -= ratioChangeIncrement;
  } else {
    return;
  }
}
