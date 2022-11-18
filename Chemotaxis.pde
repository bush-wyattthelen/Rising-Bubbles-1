import java.util.ArrayList;

ArrayList<Cell> cells = new ArrayList<Cell>();

void setup() {
  size(800, 800);
  cells.add(new Cell(width/2, height/2));
}

void draw() {
  background(255);
  for (int i = 0; i < cells.size(); i++) {
    Cell tempCell = cells.get(i);
    tempCell.move();
    tempCell.show();
    tempCell.develop();
  }
}

void mouseClicked() {
  for (int i = 0; i < cells.size(); i++) {
    Cell tempCell = cells.get(i);
    tempCell.x = (int)(Math.random() * width);
    tempCell.y = (int)(Math.random() * height);
  }
}

class Cell {
  float x;
  float y;
  int development;
  float slideSpeed;
  float slideAngle;
  int cellSize;

  Cell(int xIn, int yIn) {
    x = xIn;
    y = yIn;
    development = 225;
    cellSize = 40;
  }
  
  Cell(float xIn, float yIn, float slideSpeedIn, float slideAngleIn) {
    x = xIn;
    y = yIn;
    
    development = 225;
    cellSize = 40;
    
    slideSpeed = slideSpeedIn;
    slideAngle = slideAngleIn;
  }
  
  void show() {
    cellSize = Math.round(-0.12 * development + 67);
    
    fill(0, development, 0, 100);
    stroke(0, 100);
    ellipse(Math.round(x), Math.round(y), cellSize, cellSize);
  }
  
  void move() {
    float xDirection;
    float yDirection;
    
    xDirection = sqrt(abs(mouseX - x) / 400.0) / 1.3;
    yDirection = sqrt(abs(mouseY - y) / 400.0) / 1.3;
    
    if(mouseX < this.x) xDirection = -xDirection;
    if(mouseY < this.y) yDirection = -yDirection;
    
    x += xDirection * ((int)(Math.random() * 6) - 1);
    y += yDirection * ((int)(Math.random() * 6) - 1);
    
    x += slideSpeed * cos(slideAngle);
    y += slideSpeed * sin(slideAngle);
    
    slideSpeed = (slideSpeed - 0.1 > 0) ? slideSpeed - 0.1 : 0;
  }
  
  void develop() {
    if (Math.random() > 0.7) development--;
    
    if (development == 125) {
      development = 225;
      splitCell();
    }
  }
  
  void splitCell() {
    float tempDegree = (float)(Math.random() * 2 * PI);
    
    slideSpeed = 3;
    slideAngle = tempDegree;
    
    cells.add(new Cell(x, y, 3, PI + slideAngle));
  }
}
