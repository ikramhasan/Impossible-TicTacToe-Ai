class MiniMaxAi {
  int checkCount = 0;

  move(board, availablePositions) {
    int bestScore = -999999999;
    var bestMove;

    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        board[i] = 'O';
        var score = minimax(board, 0, false);
        board[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    print(checkCount);
    checkCount = 0;
    if (availablePositions.length > 4) board[bestMove] = 'O';
  }

  var scores = {
    'X': -10,
    'O': 10,
    'DRAW': 0,
  };

  minimax(board, depth, isMaximizingPlayer) {
    checkCount++;
    var result = checkAIWinner(board);
    if (result != 'NONE') {
      return scores[result];
    }

    if (isMaximizingPlayer) {
      int bestScore = -999999999;
      for (int i = 0; i < board.length; i++) {
        if (board[i].isEmpty) {
          board[i] = 'O';
          var score = minimax(board, depth + 1, false);
          board[i] = '';
          //alpha = max<double>(alpha, score);
          //if (beta <= alpha) break;
          if (score > bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 999999999;
      for (int i = 0; i < board.length; i++) {
        if (board[i].isEmpty) {
          board[i] = 'X';
          var score = minimax(board, depth + 1, true);
          board[i] = '';
          //beta = min<double>(beta, score);
          //if (beta <= alpha) break;
          if (score < bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    }
  }

  checkAIWinner(board) {
    String tempWinner = 'NONE';
    // Win state 1
    if (board[0] == board[1] && board[0] == board[2] && board[0].isNotEmpty) {
      tempWinner = board[0];
    }

    // Win state 2
    else if (board[3] == board[4] &&
        board[3] == board[5] &&
        board[3].isNotEmpty) {
      tempWinner = board[3];
    }

    // Win state 3
    else if (board[6] == board[7] &&
        board[6] == board[8] &&
        board[6].isNotEmpty) {
      tempWinner = board[6];
    }

    // Win state 4
    else if (board[0] == board[3] &&
        board[0] == board[6] &&
        board[0].isNotEmpty) {
      tempWinner = board[0];
    }

    // Win state 5
    else if (board[1] == board[4] &&
        board[1] == board[7] &&
        board[1].isNotEmpty) {
      tempWinner = board[1];
    }

    // Win state 6
    else if (board[2] == board[5] &&
        board[2] == board[8] &&
        board[2].isNotEmpty) {
      tempWinner = board[2];
    }

    // Win state 7
    else if (board[0] == board[4] &&
        board[0] == board[8] &&
        board[0].isNotEmpty) {
      tempWinner = board[0];
    }

    // Win state 8
    else if (board[2] == board[4] &&
        board[2] == board[6] &&
        board[2].isNotEmpty) {
      tempWinner = board[2];
    }

    int spot = 0;
    for (int i = 0; i < 9; i++) {
      if (board[i].isEmpty) spot++;
    }

    if (spot == 0 && tempWinner == 'NONE') tempWinner = 'DRAW';

    return tempWinner;
  }
}
