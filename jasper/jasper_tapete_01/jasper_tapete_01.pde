// --- SETTINGS ---
final int canvasWidth = 1000;
final int canvasHeight = 500;

final color canvasColor = color(255,255,255);

final int FPS = 50;

int biomeCount = 4;

final float displayRatio = 1;

boolean sketchFullScreen() {
  if (displayRatio == 1) return true;
  else return false;
}

// --- VARIABLES ---
int count = 0;
boolean programStarted = false;

Biome[] biomes;



void setup(){
  size((int)(canvasWidth*displayRatio), (int)(canvasHeight*displayRatio));
  frameRate(FPS);
  background(canvasColor);
  textSize(16);
  fill(0);
  text("s = save frame", 50, (canvasHeight/2)-30);
  text("d = new biomes", 50, (canvasHeight/2));
  text("f = start program", 50, (canvasHeight/2)+30);
  initialiseBiomes();
}

void keyPressed(){
  if (key == 's'){
    if (programStarted)
      saveCanvas();
  }
  
  if (key == 'd'){
    if (!programStarted){
      generateBiomes();
      background(canvasColor);
      localizeBiomes();
    }
  }
  
  if (key == 'f'){
    if (!programStarted){
      background(canvasColor);
      programStarted = true;
    }
  }
  
}

void saveCanvas(){
  String fileName = "";
  fileName += nf(year(),4) + "_" + nf(month(),2) + "_" + 
              nf(day(),2) + "_" + nf(hour(),2) + "_" + 
              nf(minute(),2) + "_" + nf(second(),2) + "_" + 
              canvasWidth + "x" + canvasHeight + "_" + frameCount;
  saveFrame(fileName);
}
