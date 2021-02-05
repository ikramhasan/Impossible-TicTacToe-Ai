import 'package:get/get.dart';

import 'package:tic_tac_toe/model/tictactoe.dart';

class TicTacToeController extends GetxController {
  final tictactoe = TicTacToe().obs;

  insert(int index, String move) {
    if (tictactoe.value.board[index].isEmpty &&
        tictactoe.value.winner == 'NONE') {
      tictactoe.update((val) {
        val.board[index] = move;
        val.availablePositions.remove(index);
        val.checkWinner();
        val.aiMove();
        val.checkWinner();
      });
    }
  }

  clearBoard() {
    tictactoe.update((val) {
      val.board = ['', '', '', '', '', '', '', '', ''];
      val.availablePositions = [0, 1, 2, 3, 4, 5, 6, 7, 8];
      val.winner = 'NONE';
      print('Board Cleared');
    });
  }
}
