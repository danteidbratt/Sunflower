int centerX;
int centerY;
boolean displayText = true;

int size = 700;
int numberOfSeeds = 500;
int seedSize = 10;
int textSize = 30;

// Phi = 0.61803398875
// e = 2.71828182846
// sqrt(2) = 1.41421356237
float ratio = 0.61803398875;
 
float ratioChange = 0;
float ratioChangeIncrement = 0.000001;
int speed = 0;
int fallbackSpeed = 0;

float distance = size / numberOfSeeds;


void setup() {
  fullScreen();
  frameRate(60);
  noCursor();
  strokeWeight(seedSize);
  stroke(255, 200, 0);
  fill(200);
  textSize(30);
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
  point(
    centerX + cos(radians(angle)) * radius, 
    centerY + sin(radians(angle)) * radius);
}

void updateRatioChange() {
   ratioChange = speed * ratioChangeIncrement; 
}

void writeText() {
  if (displayText) {
    noStroke();
    fill(20);
    rect(20, 20, 160, 85);
    stroke(255, 200, 0);
    fill(200);
    text(
    String.format("%.4f\n", ratio) + 
    (speed > 0 ? "+" : "") + speed,
    30, 50);
  }
}

void togglePlay() {
  int temp = speed;
  speed = fallbackSpeed;
  fallbackSpeed = temp;
  updateRatioChange();
}

void keyPressed() {
  if (key == 't') {
    displayText = !displayText;
  } 
  if (key == ' ') {
    togglePlay();
  } else if (keyCode == UP) {
    speed++;
    fallbackSpeed = 0;
    updateRatioChange();
  } else if (keyCode == DOWN) {
    speed--;
    fallbackSpeed = 0;
    updateRatioChange();
  } else if (key == '+') {
    strokeWeight(seedSize++);
  } else if (key == '-') {
    strokeWeight(seedSize--);
  } else {
    return;
  }
}
