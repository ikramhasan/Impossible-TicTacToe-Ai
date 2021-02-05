import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';

class Board extends StatelessWidget {
  final TicTacToeController controller;
  final int index;

  const Board({Key key, this.controller, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String asset;
    if (controller.tictactoe.value.board[index] == 'X') {
      asset = 'assets/images/ex_inv.png';
    } else if (controller.tictactoe.value.board[index] == 'O') {
      asset = 'assets/images/oh_inv.png';
    }

    return GestureDetector(
      onTap: () {
        controller.insert(index, 'X');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
          child: controller.tictactoe.value.board[index].isNotEmpty
              ? Image.asset(
                  asset,
                  height: 60,
                  width: 60,
                )
              : Container(),
        ),
      ),
    );
  }
}
