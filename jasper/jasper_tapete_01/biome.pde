class Biome {
  int bType;
  float bPosX;
  float bPosY;
  float bSize;
  float bRed;
  float bBlue;
  float bGreen;
  
  Biome (int type, float posX, float posY, float size, float red, float blue, float green) {
 
    bType = type;
    bPosX = posX;
    bPosY = posY;
    bSize = size;
    bRed = red;
    bBlue = blue;
    bGreen = green;
  }
}

void initialiseBiomes(){
  println("- - - - -");
  println("PREPARING " + biomeCount + " biomes for initialisation!");
  biomes = new Biome[biomeCount];
  
  for (int a = 0; a < biomeCount; a++){
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

void generateBiomes(){
  println("- - - - -");
  for (int a = 0; a < biomeCount; a++){
    println("BIOME " + a + " generated!");
    //generate settings for each biome
    int genType = 0;
    float genPosX = random(0, canvasWidth);
    float genPosY = random(0, canvasHeight);
    float genSize = random(10, 200);
    float genRed = random(255);
    float genBlue = random(255);
    float genGreen = random(255);
    
    biomes[a].bType = genType;             
    biomes[a].bPosX = genPosX;
    biomes[a].bPosY = genPosY;
    biomes[a].bSize = genSize;          
    biomes[a].bRed = genRed;
    biomes[a].bBlue = genBlue; 
    biomes[a].bGreen = genGreen;  
  }
}

