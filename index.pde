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
