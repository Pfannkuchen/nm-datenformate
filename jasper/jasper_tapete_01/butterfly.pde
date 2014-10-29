void drawButterfly() {
  noFill();

  println("PHASE: " + butterflyPhase);
  //println(radialIndex);

  if (butterflyPhase == 1) drawMain();
  else if (butterflyPhase == 2) drawDarks();
  else if (butterflyPhase == 3) drawLights();
  else if (butterflyPhase == 4) drawSprinkles();
  else if (butterflyPhase == 5) drawDetails();
}

void drawDetails() {
}

void drawSprinkles() {
}

void drawLights() {
  for (int s = 0; s < biomeCount; s++)
  {
    biomes[s].mutateMainColor();

    stroke(random(230-(biomes[s].actualRed/10),230), random(230-(biomes[s].actualGreen/10),230), random(230-(biomes[s].actualBlue/10),230), 80);
    strokeWeight(10 * radialStrokeSize * dist(0, radialIndex, 0, 0));

    float radialBonus = 0;

    float stepOffset = (int)random(radialSteps);
    stepOffset /= radialSteps;
    //println(stepOffset);

    for (float a = 0; a < radialSteps; a++) {
 
      radialBonus += random(-radialAnomaly, radialAnomaly) * radialIndex * 2;

      translate(biomes[s].bPosX-canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX-canvasWidth), -biomes[s].bPosY);

      translate(biomes[s].bPosX, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-biomes[s].bPosX, -biomes[s].bPosY);

      translate(biomes[s].bPosX+canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX+canvasWidth), -biomes[s].bPosY);
    }
  }

  radialIndex -= radialDecrement/100;
  if (radialIndex < 0) {
    butterflyPhase = 4;
  }
}

void drawDarks() {
  for (int s = 0; s < biomeCount; s++)
  {
    biomes[s].mutateMainColor();

    stroke(biomes[s].actualRed/10, biomes[s].actualGreen/10, biomes[s].actualBlue/10);
    strokeWeight(10 * radialStrokeSize * dist(0, radialIndex, 0, 0));

    float radialBonus = 0;

    float stepOffset = (int)random(radialSteps);
    stepOffset /= radialSteps;
    //println(stepOffset);

    for (float a = 0; a < radialSteps; a++) {

      radialBonus += random(-radialAnomaly, radialAnomaly) * radialIndex;
      if (booler(10)) {
        radialBonus += random(-radialAnomaly, radialAnomaly) * radialIndex * 5;
      }

      translate(biomes[s].bPosX-canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX-canvasWidth), -biomes[s].bPosY);

      translate(biomes[s].bPosX, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-biomes[s].bPosX, -biomes[s].bPosY);

      translate(biomes[s].bPosX+canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX+canvasWidth), -biomes[s].bPosY);
    }
  }

  radialIndex -= radialDecrement/3;
  if (radialIndex < 0) {
    butterflyPhase = 3;
    radialIndex = radialFactor/14;
  }
}

void drawMain() {
  for (int s = 0; s < biomeCount; s++)
  {
    biomes[s].mutateMainColor();

    stroke(biomes[s].actualRed, biomes[s].actualGreen, biomes[s].actualBlue, radialOpacity);
    strokeWeight(5 * radialStrokeSize * dist(0, radialIndex, 0, 0));

    float radialBonus = 0;

    float stepOffset = (int)random(radialSteps);
    stepOffset /= radialSteps;
    //println(stepOffset);

    for (float a = 0; a < radialSteps; a++) {

      radialBonus += random(-radialAnomaly, radialAnomaly) * radialIndex;
      if (booler(10)) {
        radialBonus += random(-radialAnomaly, radialAnomaly) * radialIndex * 5;
      }

      translate(biomes[s].bPosX-canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX-canvasWidth), -biomes[s].bPosY);

      translate(biomes[s].bPosX, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-biomes[s].bPosX, -biomes[s].bPosY);

      translate(biomes[s].bPosX+canvasWidth, biomes[s].bPosY);
      rotate(TWO_PI * (a / radialSteps) + stepOffset);
      line(0, 0, biomes[s].bSize * radialIndex + radialBonus, 0);
      rotate(-(TWO_PI * (a / radialSteps) + stepOffset));
      translate(-(biomes[s].bPosX+canvasWidth), -biomes[s].bPosY);
    }
  }

  radialIndex -= radialDecrement;
  if (radialIndex < 0) {
    butterflyPhase = 2;
    radialIndex = radialFactor/8;
  }
}

