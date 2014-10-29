void draw() {
  if (programStarted)
  {
    //drawTravellers();
    //drawLines();
    drawButterfly();
  }

  if (frameCount % FPS == 0 && programStarted) {
    //println(hour() + "_" + minute() + "_" + second() + "_travellers: " + travellerListSize);
  }
}

void localizeBiomes() {
  for (int i = 0; i < biomeCount; i++) {
    noFill();
    stroke(biomes[i].bRed, biomes[i].bGreen, biomes[i].bBlue);
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

