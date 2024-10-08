int grid = 4;
int[][] board = new int[grid][grid];
boolean[][] revealed = new boolean[grid][grid];
boolean[][] matched = new boolean[grid][grid];
int firstCardX = -1, firstCardY = -1;
int secondCardX = -1, secondCardY = -1;
boolean waitingForSecondCard = false;
boolean checkingForMatch = false;
int revealTime = 0;

void setup() {
  size(800, 800); // Set up a window of 800x800 pixels.
  getNum();  // Fill the board with random pairs of numbers.
  display();  // Display the grid initially.
}

void draw() {
  display();
  
  if (checkingForMatch && millis() > revealTime + 1000) {
    checkMatch();
    checkingForMatch = false;
  }
}

void mousePressed() {
  int i = mouseX / 200;
  int j = mouseY / 200;
  
  if (i >= 0 && i < grid && j >= 0 && j < grid) {
    if (!waitingForSecondCard) {
      if (!revealed[i][j] && !matched[i][j]) {
        firstCardX = i;
        firstCardY = j;
        revealed[i][j] = true;
        waitingForSecondCard = true;
      }
    } else if (!checkingForMatch) {
      if (!revealed[i][j] && !matched[i][j]) {
        secondCardX = i;
        secondCardY = j;
        revealed[i][j] = true;
        revealTime = millis();
        checkingForMatch = true;
      }
    }
  }
}

void checkMatch() {
  if (board[firstCardX][firstCardY] == board[secondCardX][secondCardY]) {
    matched[firstCardX][firstCardY] = true;
    matched[secondCardX][secondCardY] = true;
  } else {
    revealed[firstCardX][firstCardY] = false;
    revealed[secondCardX][secondCardY] = false;
  }
  waitingForSecondCard = false;
}

void getNum() {
  int[] numbers = new int[grid * grid];
  int index = 0;
  for (int n = 1; n <= (grid * grid) / 2; n++) {
    numbers[index++] = n;
    numbers[index++] = n;
  }
  
  for (int i = numbers.length - 1; i > 0; i--) {
    int j = int(random(i + 1));
    int temp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = temp;
  }
  
  index = 0;
  for (int i = 0; i < grid; i++) {
    for (int j = 0; j < grid; j++) {
      board[i][j] = numbers[index++];
    }
  }
}

void display() {
  for (int i = 0; i < grid; i++) {
    for (int j = 0; j < grid; j++) {
      int x = i * 200;
      int y = j * 200;
      
      if (matched[i][j]) {
        fill(0, 255, 0);
      } else if (revealed[i][j]) {
        fill(255);
      } else {
        fill(100);
      }
      rect(x, y, 200, 200);
      
      if (revealed[i][j]) {
        fill(0);
        textSize(32);
        textAlign(CENTER, CENTER);
        text(board[i][j], x + 100, y + 100);
      }
    }
  }
}
