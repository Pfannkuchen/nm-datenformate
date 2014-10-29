// --- SETTINGS ---
final int canvasWidth = 1000;           // breite
final int canvasHeight = 600;           // hoehe

final color canvasColor = color(255);   // starthintergrund

String saveLocation = "03_mittwoch/";

final int FPS = 50;                     // maximale bilder pro sekunde

int biomeCount = 5;                    // anzahl biome (klein z.b. 25)
float biomeSizeFactor = 1;            // standard = 1 (klein z.b. 0.1

float radialFactor = 5;                 // main draw biome size multiplier
float radialDecrement = 0.15;           // main draw steps
float radialStrokeSize = 0.5;           // main draw line weight
float radialOpacity = 10;               // main draw line opacity 0 - 255
float radialAnomaly = 1;                // amplitude eines rings
float radialSteps = 360;                // main draw lines in all directions 0 - 360
float radialColorChange = 60;           // minimum range for color mutation
float radialCritColor = 5;              // when color change crits, factor

// --- VARIABLES ---
boolean programStarted = false;
float radialIndex;
float opacityFactor = 0;
int butterflyPhase = 1;
Biome[] biomes;







// --- OLD ---
float stepFactor = 1;
float wierdFactor = 1.1;
float opacityGuide = 3;
float strokeFactor = 12.2;

int count = 0;
ArrayList travellerList;

boolean sketchFullScreen() {
  return false;
}



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
  text("s = save frame", 10, (canvasHeight/2)-30);
  text("d = new biomes", 10, (canvasHeight/2));
  text("f = start program", 10, (canvasHeight/2)+30);
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
      drawButterfly();
      localizeBiomes();
      textHotkeys();
    }
    else{
      generateBiomes();
      background(canvasColor);
      //drawButterfly();
      localizeBiomes();
      textHotkeys();
      programStarted = false;
      butterflyPhase = 1;
    }
  }

  if (key == 'f') {
    if (!programStarted) {
      background(canvasColor);
      radialIndex = radialFactor;
      programStarted = true;
      butterflyPhase = 1;
      //localizeBiomes();
      //TESTINIT();
    }
  }
}

void saveCanvas() {
  String fileName = "";
  fileName += saveLocation;
  fileName += nf(year(), 4) + "_" + nf(month(), 2) + "_" + 
    nf(day(), 2) + "_" + nf(hour(), 2) + "_" + 
    nf(minute(), 2) + "_" + nf(second(), 2) + "_" + 
    canvasWidth + "x" + canvasHeight + "_" + frameCount + ".png";
  saveFrame(fileName);
}

