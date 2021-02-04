import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';

class Board extends StatelessWidget {
  final TicTacToeController controller;
  final int index;

  const Board({Key key, this.controller, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Text(
            controller.board[index],
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: controller.board[index] == 'X'
                  ? Colors.greenAccent
                  : Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
