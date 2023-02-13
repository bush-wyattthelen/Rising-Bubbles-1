import java.util.ArrayList;

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

static int maxBubblesOnScreen = 50;
int bubblesPrinted = 0;
static int totalBubbles = 300;

int cooldown = 0;
Boolean jiggle = false;

void setup() {
  size(800, 600);
  noStroke();
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  
  if (bubbles.size() < maxBubblesOnScreen && bubblesPrinted < totalBubbles) {
    if (cooldown == 0) {
      bubbles.add(new Bubble());
      bubblesPrinted++;
      cooldown = 5;
    }
    else {
      cooldown--;
    }
  }
  
  for (int i = 0; i < bubbles.size(); i++) {
    bubbles.get(i).rise();
    if (bubbles.get(i).y + bubbles.get(i).size < 0) {
      bubbles.remove(i);
      i--;
    }
    else {
      bubbles.get(i).display();
    }
  }
  
  // Display number of bubbles created
  fill(255);
  stroke(0);
  rect(0, 0, 100, 50);
  fill(0);
  text("Num Bubbles: " + bubbles.size(), 50, 25);
}

void mouseClicked() {
  jiggle = !jiggle;
}

int betterRandom(int lower, int upper) {
  return (int)(Math.random() * (upper - lower + 1) + lower);
}
