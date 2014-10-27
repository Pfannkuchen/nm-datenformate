void TESTINIT() {
  for (int b = 0; b < biomeCount; b++) {
    for (int t = 0; t < /*biomes[b].bSize*/10; t++) {
      createTraveller(biomes[b].bPosX+random(-biomes[b].bSize/10, biomes[b].bSize/10), 
                      biomes[b].bPosY+random(-biomes[b].bSize/10, biomes[b].bSize/10), 
                      biomes[b].bRed, biomes[b].bBlue, biomes[b].bGreen);
    }
  }
}

