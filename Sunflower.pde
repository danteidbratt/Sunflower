int centerX;
int centerY;
boolean displayText = false;
boolean looping = true;

int size = 800;
int seedSize = 10;
int numberOfSeeds = 400;
float previousAngle = 0;
float currentAngle;
float ratio = 0;
float ratioChange = 0.0000001;
float ratioChangeIncrement = 0.0000001;

float distance = size / numberOfSeeds;


void setup() {
  fullScreen();
  noCursor();
  noStroke();
  textSize(30);
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
  float angle = 0;
  float radius = 0;
  placeSeed(angle, radius);
  for (int i = 0; i < numberOfSeeds; i++) {
    angle += 360 * ratio;
    radius += distance;
    placeSeed(angle, radius);
  }
}

void placeSeed(float angle, float radius) {
  ellipse(centerX + cos(angle) * radius, centerY + sin(angle) * radius, seedSize, seedSize);
}

void writeText() {
  if (displayText) {
    fill(200);
    text(String.format("%.6f", ratio), 30, 50);
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
  } else if (keyCode == LEFT) {
    ratioChange -= ratioChangeIncrement;
  } else if (keyCode == RIGHT) {
    ratioChange += ratioChangeIncrement;
  } else {
    return;
  }
}
