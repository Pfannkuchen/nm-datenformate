class Traveller {
  float tPosX;
  float tPosY;
  float tRed;
  float tBlue;
  float tGreen;

  float targetX = 0;
  float targetY = 0;

  Traveller (float posX, float posY, float red, float blue, float green) {
    tPosX = posX;
    tPosY = posY;
    tRed = red;
    tBlue = blue;
    tGreen = green;

    targetX = tPosX;
    targetY = tPosY;
  }

  void move() {
    float xOff = random(-5, 5);
    float helpX = this.tPosX;
    helpX += xOff;
    if (helpX < 0) tPosX = canvasWidth-(xOff-tPosX);
    else if (helpX > canvasWidth) tPosX = 0+(xOff-tPosX);
    else tPosX += xOff;

    float yOff = random(-5, 5);
    float helpY = this.tPosY;
    helpY += yOff;
    if (helpY < 0) tPosY = canvasHeight-(yOff-tPosY);
    else if (helpY > canvasHeight) tPosY = 0+(yOff-tPosY);
    else tPosY += yOff;
  }

  void newTarget() {
    this.targetX = tPosX;
    this.targetY = tPosY;
    println("---");
    for (int b = 0; b < biomeCount; b++) {
      if (dist(this.tPosX, this.tPosY, biomes[b].bPosX, biomes[b].bPosY) > 
        dist(this.tPosX, this.tPosY, targetX, targetY)) {
        targetX = biomes[b].bPosX;
        targetY = biomes[b].bPosY;
        //println("FRAME " + frameCount + " / BIOME " + b + " / IF 1 / tPosX " + (int)tPosX + " / tPosY " + (int)tPosY + " / bPosX " + (int)biomes[b].bPosX + " / bPosY " + (int)biomes[b].bPosY + " / targetX " + (int)targetX + " / targetY " + (int)targetY);
      }
    }

    if (dist(this.tPosX, this.tPosY, targetX-canvasWidth, targetY) < 
      dist(this.tPosX, this.tPosY, targetX, targetY)) {
      targetX = targetX-canvasWidth;
      //println("FRAME " + frameCount + " / IF 2 / tPosX " + (int)tPosX + " / tPosY " + (int)tPosY + " / targetX " + (int)targetX + " / targetY " + (int)targetY);
    } else if (dist(this.tPosX, this.tPosY, targetX+canvasWidth, targetY) < 
      dist(this.tPosX, this.tPosY, targetX, targetY)) {
      targetX = targetX+canvasWidth;
      //println("FRAME " + frameCount + " / IF 3 / tPosX " + (int)tPosX + " / tPosY " + (int)tPosY + " / targetX " + (int)targetX + " / targetY " + (int)targetY);
    } else if (dist(this.tPosX, this.tPosY, targetX, targetY-canvasHeight) < 
      dist(this.tPosX, this.tPosY, targetX, targetY)) {
      targetY = targetY-canvasHeight;
      //println("FRAME " + frameCount + " / IF 4 / tPosX " + (int)tPosX + " / tPosY " + (int)tPosY + " / targetX " + (int)targetX + " / targetY " + (int)targetY);
    } else if (dist(this.tPosX, this.tPosY, targetX, targetY+canvasHeight) < 
      dist(this.tPosX, this.tPosY, targetX, targetY)) {
      targetY = targetY+canvasHeight;
      //println("FRAME " + frameCount + " / IF 5 / tPosX " + (int)tPosX + " / tPosY " + (int)tPosY + " / targetX " + (int)targetX + " / targetY " + (int)targetY);
    }
  }
  
  void newTarget2() {
int helpNumber = (int)random(0,biomeCount);
  targetX = biomes[helpNumber].bPosX;
  targetY = biomes[helpNumber].bPosY;
      
  }
  
  void modColor() {
    float helpRed = 0;
    float helpRedDist = 9999;
    for (int b = 0; b < biomeCount; b++){
      if (dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY) < helpRedDist) helpRedDist = dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY);
      else if (dist(tPosX, tPosY, biomes[b].bPosX+canvasWidth, biomes[b].bPosY) < helpRedDist) helpRedDist = dist(tPosX, tPosY, biomes[b].bPosX+canvasWidth, biomes[b].bPosY);
      else if (dist(tPosX, tPosY, biomes[b].bPosX-canvasWidth, biomes[b].bPosY) < helpRedDist) helpRedDist = dist(tPosX, tPosY, biomes[b].bPosX-canvasWidth, biomes[b].bPosY);
      else if (dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY+canvasHeight) < helpRedDist) helpRedDist = dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY+canvasHeight);
      else if (dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY-canvasHeight) < helpRedDist) helpRedDist = dist(tPosX, tPosY, biomes[b].bPosX, biomes[b].bPosY-canvasHeight);
    }
    helpRed = helpRedDist;
    tRed = helpRed;
    
   
    //tRed += random(-5,5);
    //tGreen += random(-5,5);
    //tBlue += random(-5,5);
  }

  void move2() {
    float xOff = (this.targetX - this.tPosX)/200;
    xOff += random(-6, 6);
    for (int b = 0; b < biomeCount; b++) {
      if (biomes[b].bPosX > tPosX) xOff -= dist(biomes[b].bPosX, 0, tPosX, 0)/10000;
      else xOff += dist(biomes[b].bPosX, 0, tPosX, 0)/10000;
    }

    float helpX = this.tPosX;
    helpX += xOff;
    if (helpX < 0) { 
      tPosX = canvasWidth-(xOff-tPosX);
      this.targetX += canvasWidth;
    } else if (helpX > canvasWidth) { 
      tPosX = 0+(xOff-tPosX);
      this.targetX -= canvasWidth;
    } else { 
      tPosX += xOff;
    }


    float yOff = (this.targetY - this.tPosY)/200;
    yOff += random(-6, 6);

    for (int b = 0; b < biomeCount; b++) {
      if (biomes[b].bPosY > tPosY) yOff -= dist(biomes[b].bPosY, 0, tPosY, 0)/10000;
      else yOff += dist(biomes[b].bPosY, 0, tPosY, 0)/10000;
    }

    float helpY = this.tPosY;
    helpY += yOff;
    if (helpY < 0) { 
      tPosY = canvasHeight-(yOff-tPosY);
      this.targetY += canvasHeight;
    } else if (helpY > canvasHeight) { 
      tPosY = 0+(yOff-tPosY);
      this.targetY -= canvasHeight;
    } else tPosY += yOff;
  }

  void drop() {
    noFill();
    stroke(this.tRed, this.tBlue, this.tGreen);
    float weight = 100 - frameCount/35;
    if (weight < 1) weight = 1;
    strokeWeight(weight);
    point(this.tPosX, this.tPosY);

    //stroke(255, 0, 0);
    //strokeWeight(2);
    //point(this.targetX, this.targetY);
  }
}

void clearTravellerList() {
  int travellerListSize = travellerList.size();

  // alle Elemente aus travellerList löschen
  for (int c = travellerListSize; c > 0; c--) {
    Traveller traveller = (Traveller) travellerList.get(c-1);
    travellerList.remove(traveller);
  }
}

void createTraveller(float genPosX, float genPosY, float genRed, float genBlue, float genGreen) {
  travellerList.add(new Traveller(genPosX, genPosY, genRed, genBlue, genGreen));
}

