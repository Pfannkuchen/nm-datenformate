void draw() {
  /*
  count++;
  if (count > 200) count = 0;
  stroke(255, (int)random(255), 150);
  noFill();
  strokeWeight(count/10);
  ellipse(canvasWidth/2, canvasHeight/2, count, count);  
  */
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

