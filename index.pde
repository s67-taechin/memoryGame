int grid = 4;
int[][] board = new int[grid][grid];
boolean[][] revealed = new boolean[grid][grid];
boolean[][] matched = new boolean[grid][grid];
int firstCardX = -1, firstCardY = -1;
int secondCardX = -1, secondCardY = -1;
boolean waitingForSecondCard = false;
boolean checkingForMatch = false;
int revealTime = 0;

