class Bubble {
  int[] colors;
  int size;
  float x;
  float y;
  float ySpeed;
  
  Bubble() {
    colors = new int[4];
    
    // Randomize red, green, blue and alpha values
    for (int i = 0; i < colors.length - 1; i++) {
      colors[i] = betterRandom(0, 255);
    }
    colors[colors.length - 1] = betterRandom(100, 200);
    
    // Randomize size
    size = betterRandom(100, 120);
    
    // Set x to be between the borders of the screen
    // Set y to be immediately below the lower bound of the screen
    x = betterRandom(0, width);
    y = height + size;
    
    // Set ySpeed to be proportional to the size
    // ySpeed = Math.round(-0.1 * size + 13);
    ySpeed = 0.08 * size - 7.6;
  }
  
  void display() {
    fill(colors[0], colors[1], colors[2], colors[3]);
    noStroke();
    ellipse(Math.round(x), Math.round(y), size, size);
  }
  
  void rise() {
    if (jiggle == true) x += Math.random() - 0.5;
    y -= ySpeed;
  }
}
