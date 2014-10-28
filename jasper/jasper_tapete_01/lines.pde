float getBiomeDistance(int s, int o) {
  float bd;
  bd = dist(biomes[s].bPosX, biomes[s].bPosY, biomes[o].bPosX, biomes[o].bPosY);
  bd /= dist(0, 0, canvasWidth, canvasHeight);
  return bd;
}

void drawLines() {
  float oldX = 0;
  float oldY = 0;
  float x = 0;
  float y = 0;
  float t = 0;
  
  opacityFactor = random(opacityGuide);

  for (int s = 0; s < biomeCount; s++) {    // biome subjekt
    for (int o = 0; o < biomeCount; o++) {  // biome objekt
    
    
      /* keine füllfarbe */
      noFill();

      /* distanz zwischen den zwei betreffenden biomen ermitteln */
      float biomeDist = getBiomeDistance(s, o); 

      /* farben der biome holen */
      color from = color(biomes[s].bRed, biomes[s].bBlue, biomes[s].bGreen);
      color to = color(biomes[o].bRed, biomes[o].bBlue, biomes[o].bGreen);

      /* steps je nach distanz zwischen den biomen und dem faktor */
      int steps = (int)(biomeDist * 100 * stepFactor);

      /*
      float rX1 = random(-biomes[s].bSize * wierdFactor / biomes[s].bSize * wierdFactor);
       float rX2 = random(-biomes[o].bSize * wierdFactor / biomes[o].bSize * wierdFactor);
       float rY1 = random(-biomes[s].bSize * wierdFactor / biomes[s].bSize * wierdFactor);
       float rY2 = random(-biomes[o].bSize * wierdFactor / biomes[o].bSize * wierdFactor);
       */

      int lerpBiome1 = (int)random(0, biomeCount);
      int lerpBiome2 = (int)random(0, biomeCount);
      float rX1 = biomes[lerpBiome1].bPosX;
      float rX2 = biomes[lerpBiome2].bPosX;
      float rY1 = biomes[lerpBiome1].bPosY;
      float rY2 = biomes[lerpBiome2].bPosY;
      
      rX1 += random(-wierdFactor*biomes[lerpBiome1].bSize , wierdFactor*biomes[lerpBiome1].bSize);
      //rX2 += random(-wierdFactor*biomes[lerpBiome2].bSize , wierdFactor*biomes[lerpBiome2].bSize);
      rY1 += random(-wierdFactor*biomes[lerpBiome1].bSize , wierdFactor*biomes[lerpBiome1].bSize);
      //rY2 += random(-wierdFactor*biomes[lerpBiome2].bSize , wierdFactor*biomes[lerpBiome2].bSize);

      //println(lerpBiome1 + " " + lerpBiome2 + " / " + biomes[lerpBiome1].bPosX + " " + biomes[lerpBiome1].bPosY);

      for (int i = 0; i <= steps; i++) {    // bezier kurve zeichnen mit farbverlauf
        t = i / float(steps);

        // biome groß, mitte klein 
        float strokeSize = i-(steps/2);

        // biome klein, mitte groß
        /*
        float strokeSize;
        if (i < steps/2) strokeSize = i;
        else strokeSize = steps-i;
        */

        // vermeide negative strokeSize
        if (strokeSize < 0) strokeSize *= -1;
        strokeSize *= biomeDist;

        // dicke und farbe der bezier kurve einstellen
        strokeWeight(strokeSize*strokeFactor);
        stroke(lerpColor(from, to, t), opacityFactor);

        // bezier kurvenpunkt berechnen      
        x = bezierPoint(biomes[s].bPosX, rX1, rX2, biomes[o].bPosX, t);
        y = bezierPoint(biomes[s].bPosY, rY1, rY2, biomes[o].bPosY, t);

        // beim ersten mal letzten punkt generieren
        if (i == 0) { 
          oldX = x;
          oldY = y;
        }

        // bezier kurvenstueck zeichnen 
        line(x, y, oldX, oldY);

        // backup des letzten punktes 
        oldX = x;
        oldY = y;
      }


      // NACH RECHTS
      for (int i = 0; i <= steps; i++) {    // bezier kurve zeichnen mit farbverlauf
        t = i / float(steps);

        // biome groß, mitte klein 
        float strokeSize = i-(steps/2);

        // biome klein, mitte groß
        /*
        float strokeSize;
        if (i < steps/2) strokeSize = i;
        else strokeSize = steps-i;
        */

        // vermeide negative strokeSize
        if (strokeSize < 0) strokeSize *= -1;
        strokeSize *= biomeDist;

        // dicke und farbe der bezier kurve einstellen
        strokeWeight(strokeSize*strokeFactor);
        stroke(lerpColor(from, to, t), opacityFactor);

        // bezier kurvenpunkt berechnen  
        /*
          x = bezierPoint(biomes[s].bPosX, biomes[s].bPosX + rX1, biomes[o].bPosX + rX2 + canvasWidth, biomes[o].bPosX + canvasWidth, t);
          y = bezierPoint(biomes[s].bPosY, biomes[s].bPosY + rY1, biomes[o].bPosY + rY2, biomes[o].bPosY, t);
        */
        x = bezierPoint(biomes[s].bPosX, rX1, rX2 + canvasWidth, biomes[o].bPosX + canvasWidth, t);
        y = bezierPoint(biomes[s].bPosY, rY1, rY2, biomes[o].bPosY, t);

        // beim ersten mal letzten punkt generieren
        if (i == 0) { 
          oldX = x;
          oldY = y;
        }

        // bezier kurvenstueck zeichnen 
        line(x, y, oldX, oldY);

        // backup des letzten punktes 
        oldX = x;
        oldY = y;
      }




      // NACH LINKS
      for (int i = 0; i <= steps; i++) {    // bezier kurve zeichnen mit farbverlauf
        t = i / float(steps);

        // biome groß, mitte klein 
        float strokeSize = i-(steps/2);

        // biome klein, mitte groß
        /*
        float strokeSize;
        if (i < steps/2) strokeSize = i;
        else strokeSize = steps-i;
        */

        // vermeide negative strokeSize
        if (strokeSize < 0) strokeSize *= -1;
        strokeSize *= biomeDist;

        // dicke und farbe der bezier kurve einstellen
        strokeWeight(strokeSize*strokeFactor);
        stroke(lerpColor(from, to, t), opacityFactor);

        // bezier kurvenpunkt berechnen      
        x = bezierPoint(biomes[s].bPosX, rX1, rX2 - canvasWidth, biomes[o].bPosX - canvasWidth, t);
        y = bezierPoint(biomes[s].bPosY, rY1, rY2, biomes[o].bPosY, t);

        // beim ersten mal letzten punkt generieren
        if (i == 0) { 
          oldX = x;
          oldY = y;
        }

        // bezier kurvenstueck zeichnen 
        line(x, y, oldX, oldY);

        // backup des letzten punktes 
        oldX = x;
        oldY = y;
      }



      // NACH UNTEN
      for (int i = 0; i <= steps; i++) {    // bezier kurve zeichnen mit farbverlauf
        t = i / float(steps);

        // biome groß, mitte klein 
        float strokeSize = i-(steps/2);

        // biome klein, mitte groß
        /*
        float strokeSize;
        if (i < steps/2) strokeSize = i;
        else strokeSize = steps-i;
        */

        // vermeide negative strokeSize
        if (strokeSize < 0) strokeSize *= -1;
        strokeSize *= biomeDist;

        // dicke und farbe der bezier kurve einstellen
        strokeWeight(strokeSize*strokeFactor);
        stroke(lerpColor(from, to, t), opacityFactor);

        // bezier kurvenpunkt berechnen      
        x = bezierPoint(biomes[s].bPosX, rX1, rX2, biomes[o].bPosX, t);
        y = bezierPoint(biomes[s].bPosY, rY1, rY2 + canvasHeight, biomes[o].bPosY + canvasHeight, t);

        // beim ersten mal letzten punkt generieren
        if (i == 0) { 
          oldX = x;
          oldY = y;
        }

        // bezier kurvenstueck zeichnen 
        line(x, y, oldX, oldY);

        // backup des letzten punktes 
        oldX = x;
        oldY = y;
      }





      // NACH OBEN
      for (int i = 0; i <= steps; i++) {    // bezier kurve zeichnen mit farbverlauf
        t = i / float(steps);

        // biome groß, mitte klein 
        float strokeSize = i-(steps/2);

        // biome klein, mitte groß
        /*
        float strokeSize;
        if (i < steps/2) strokeSize = i;
        else strokeSize = steps-i;
        */

        // vermeide negative strokeSize
        if (strokeSize < 0) strokeSize *= -1;
        strokeSize *= biomeDist;

        // dicke und farbe der bezier kurve einstellen
        strokeWeight(strokeSize*strokeFactor);
        stroke(lerpColor(from, to, t), opacityFactor);

        // bezier kurvenpunkt berechnen      
        x = bezierPoint(biomes[s].bPosX, rX1, rX2, biomes[o].bPosX, t);
        y = bezierPoint(biomes[s].bPosY, rY1, rY2 - canvasHeight, biomes[o].bPosY - canvasHeight, t);

        // beim ersten mal letzten punkt generieren
        if (i == 0) { 
          oldX = x;
          oldY = y;
        }

        // bezier kurvenstueck zeichnen 
        line(x, y, oldX, oldY);

        // backup des letzten punktes 
        oldX = x;
        oldY = y;
      }
    }
  }
}

