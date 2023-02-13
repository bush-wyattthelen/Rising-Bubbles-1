class Bubble {
  int[] colors;
  int size;
  float x;
  float y;
  float ySpeed;
  
  Bubble() {
    
    if (Math.random() > 0.5) colors = new int[] {255, 0, 0, 0};
    else colors = new int[] {0, 0, 255, 0};
    colors[colors.length - 1] = betterRandom(50, 150);
    
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
