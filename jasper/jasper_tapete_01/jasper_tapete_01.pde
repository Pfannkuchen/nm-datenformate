// --- SETTINGS ---
final int canvasWidth = 1200;
final int canvasHeight = 600;

final color canvasColor = color(255);

final int FPS = 50;

float stepFactor = 1;
float wierdFactor = 1.1;
float opacityGuide = 3;
float strokeFactor = 12.2;


float opacityFactor = 0;

int biomeCount = 3;



boolean sketchFullScreen() {
  return true;
}

// --- VARIABLES ---
int count = 0;
boolean programStarted = false;

ArrayList travellerList;
Biome[] biomes;



void setup() {
  size((int)(canvasWidth), (int)(canvasHeight));
  frameRate(FPS);
  smooth();
  background(canvasColor);
  
  travellerList = new ArrayList();
  
  initialiseBiomes();
  textHotkeys();
}

void textHotkeys() {
  textSize(16);
  fill(0);
  text("s = save frame at runtime", 50, (canvasHeight/2)-30);
  text("d = new biomes", 50, (canvasHeight/2));
  text("f = start program", 50, (canvasHeight/2)+30);
}

void keyPressed() {
  if (key == 's') {
    if (programStarted)
      saveCanvas();
  }

  if (key == 'd') {
    if (!programStarted) {
      generateBiomes();
      background(canvasColor);
      drawLines();
      localizeBiomes();
      textHotkeys();
    }
  }

  if (key == 'f') {
    if (!programStarted) {
      background(canvasColor);
      programStarted = true;
      //localizeBiomes();
      TESTINIT();
    }
  }
}

void saveCanvas() {
  String fileName = "";
  fileName += nf(year(), 4) + "_" + nf(month(), 2) + "_" + 
    nf(day(), 2) + "_" + nf(hour(), 2) + "_" + 
    nf(minute(), 2) + "_" + nf(second(), 2) + "_" + 
    canvasWidth + "x" + canvasHeight + "_" + frameCount + ".png";
  saveFrame(fileName);
}

