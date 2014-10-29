class Biome {
  int bType;
  float bPosX;
  float bPosY;
  float bSize;
  float bRed;
  float bBlue;
  float bGreen;

  float actualRed;
  float actualBlue;
  float actualGreen;

  Biome (int type, float posX, float posY, float size, float red, float green, float blue) {

    bType = type;
    bPosX = posX;
    bPosY = posY;
    bSize = size;

    bRed = red;
    bGreen = green;
    bBlue = blue;

    actualRed = bRed;
    actualGreen = bGreen;
    actualBlue = bBlue;
  }

  void generate() {
    //generate settings for each biome
    int genType = 0;
    float genPosX = random(0, canvasWidth);
    float genPosY = random(0, canvasHeight);
    float genSize = random(10, 200);
    float genRed = random(255);
    float genBlue = random(255);
    float genGreen = random(255);

    this.bType = genType;             
    this.bPosX = genPosX;
    this.bPosY = genPosY;
    this.bSize = genSize * biomeSizeFactor;

    this.bRed = genRed;
    this.bGreen = genGreen; 
    this.bBlue = genBlue;  

    this.actualRed = this.bRed;
    this.actualGreen = this.bGreen;
    this.actualBlue = this.bBlue;
  }

  void mutateMainColor() {
    float mRed = random(radialColorChange + dist(0, this.actualRed, 0, this.bRed));
    this.actualRed = this.bRed + random(-mRed, mRed);
    if (booler(10)) this.actualRed = this.bRed + random(-mRed, mRed) * radialCritColor;


    float mGreen = random(radialColorChange + dist(0, this.actualGreen, 0, this.bGreen));
    this.actualGreen = this.bGreen + random(-mGreen, mGreen);
    if (booler(10)) this.actualGreen = this.bGreen + random(-mGreen, mGreen) * radialCritColor;

    float mBlue = random(radialColorChange + dist(0, this.actualBlue, 0, this.bBlue));
    this.actualBlue = this.bBlue + random(-mBlue, mBlue);
    if (booler(10)) this.actualBlue = this.bBlue + random(-mBlue, mBlue) * radialCritColor;
  }
}

void initialiseBiomes() {
  println("- - - - -");
  println("PREPARING " + biomeCount + " biomes for initialisation!");
  biomes = new Biome[biomeCount];

  for (int a = 0; a < biomeCount; a++) {
    println("BIOME " + a + " initialised!");
    //generate settings for each biome
    int genType = 0;
    float genPosX = random(0, canvasWidth);
    float genPosY = random(0, canvasHeight);
    float genSize = random(10, 200);
    float genRed = random(255);
    float genBlue = random(255);
    float genGreen = random(255);

    biomes[a] = new Biome(genType, 
    genPosX, genPosY, 
    genSize, 
    genRed, genBlue, genGreen);
  }
}

void generateBiomes() {
  println("- - - - -");
  for (int a = 0; a < biomeCount; a++) {
    biomes[a].generate();
    println("BIOME " + a + " generated!");
  }
}

