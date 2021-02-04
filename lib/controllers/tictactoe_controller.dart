import 'package:get/get.dart';
import 'dart:math';

class TicTacToeController extends GetxController {
  List<String> board = ['', '', '', '', '', '', '', '', ''];

  List<int> availablePositions = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  String winner = 'NONE';

  var random = new Random();

  insert(int index, String move) {
    if (board[index].isEmpty && winner == 'NONE') {
      board[index] = move;
      availablePositions.remove(index);
      checkWinner();
      aiMove();
      checkWinner();
      update();
      print('inserted $move at $index');
    }
    print(winner);
  }

  aiMove() {
    if (availablePositions.length > 1 && winner == 'NONE') {
      int index = availablePositions[random.nextInt(availablePositions.length)];
      board[index] = 'O';
      availablePositions.remove(index);
    }
  }

  clearBoard() {
    board.forEach((element) {
      element = '';
    });
    winner = 'NONE';
    update();
    print('Board Cleared');
  }

  checkWinner() {
    // Win state 1
    if (board[0] == board[1] && board[0] == board[2] && board[0].isNotEmpty) {
      winner = board[0];
    }

    // Win state 2
    else if (board[3] == board[4] &&
        board[3] == board[5] &&
        board[3].isNotEmpty) {
      winner = board[3];
    }

    // Win state 3
    else if (board[6] == board[7] &&
        board[6] == board[8] &&
        board[6].isNotEmpty) {
      winner = board[6];
    }

    // Win state 4
    else if (board[0] == board[3] &&
        board[0] == board[6] &&
        board[0].isNotEmpty) {
      winner = board[0];
    }

    // Win state 5
    else if (board[1] == board[4] &&
        board[1] == board[7] &&
        board[1].isNotEmpty) {
      winner = board[1];
    }

    // Win state 6
    else if (board[2] == board[5] &&
        board[2] == board[8] &&
        board[2].isNotEmpty) {
      winner = board[2];
    }

    // Win state 7
    else if (board[0] == board[4] &&
        board[0] == board[8] &&
        board[0].isNotEmpty) {
      winner = board[0];
    }

    // Win state 8
    else if (board[2] == board[4] &&
        board[2] == board[6] &&
        board[2].isNotEmpty) {
      winner = board[2];
    } else if (availablePositions.length < 1) {
      winner = 'DRAW';
    }
  }
}
