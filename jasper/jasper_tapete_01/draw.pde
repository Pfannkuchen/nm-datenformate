void draw() {
  int travellerListSize = travellerList.size();
  for (int n = 0; n < travellerListSize; n++) {
    Traveller traveller = (Traveller) travellerList.get(n);
    if (dist(traveller.tPosX, traveller.tPosY, traveller.targetX, traveller.targetY) < 50) {
      traveller.newTarget2();
    }
    traveller.modColor();
    traveller.move2();
    traveller.drop();
  }
  
  if (frameCount % FPS == 0 && programStarted) {
    println(hour() + "_" + minute() + "_" + second() + "_travellers: " + travellerListSize);
  }
}

void localizeBiomes() {
  for (int i = 0; i < biomeCount; i++) {
    noFill();
    stroke(biomes[i].bRed, biomes[i].bBlue, biomes[i].bGreen);
    strokeWeight(biomes[i].bSize/10);
    point(biomes[i].bPosX, biomes[i].bPosY);

    point(biomes[i].bPosX+canvasWidth, biomes[i].bPosY);
    point(biomes[i].bPosX-canvasWidth, biomes[i].bPosY);
    point(biomes[i].bPosX, biomes[i].bPosY+canvasHeight);
    point(biomes[i].bPosX, biomes[i].bPosY-canvasHeight);



    strokeWeight(biomes[i].bSize/50);
    ellipse(biomes[i].bPosX, biomes[i].bPosY, biomes[i].bSize, biomes[i].bSize);

    ellipse(biomes[i].bPosX+canvasWidth, biomes[i].bPosY, biomes[i].bSize, biomes[i].bSize);
    ellipse(biomes[i].bPosX-canvasWidth, biomes[i].bPosY, biomes[i].bSize, biomes[i].bSize);
    ellipse(biomes[i].bPosX, biomes[i].bPosY+canvasHeight, biomes[i].bSize, biomes[i].bSize);
    ellipse(biomes[i].bPosX, biomes[i].bPosY-canvasHeight, biomes[i].bSize, biomes[i].bSize);
  }
}

