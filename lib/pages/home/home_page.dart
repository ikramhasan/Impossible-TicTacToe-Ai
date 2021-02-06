import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/k_text.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';
import 'package:tic_tac_toe/pages/home/board.dart';
import 'package:tic_tac_toe/pages/home/console.dart';
import 'package:tic_tac_toe/pages/home/win_dialog.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';
import 'package:tic_tac_toe/utils/launch_url.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('height: ${size.height}');
    print('width: ${size.width}');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width / 2 - 200,
          vertical: 34,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              impossible_tictactoe,
              style: headerStyle,
            ),
            SizedBox(height: 60),
            Container(
              color: Colors.black.withOpacity(0.4),
              child: GetX<TicTacToeController>(
                  init: TicTacToeController(),
                  builder: (controller) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      String winText;
                      if (controller.tictactoe.value.winner == 'X') {
                        winText = 'You Won!';
                      } else if (controller.tictactoe.value.winner == 'O') {
                        winText = 'You Lost!';
                      } else if (controller.tictactoe.value.winner == 'DRAW') {
                        winText = 'It\'s a Draw!';
                      } else {
                        winText = controller.tictactoe.value.winner;
                      }
                      controller.tictactoe.value.winner == 'NONE'
                          ? Container()
                          : showWinDialog(winText, controller, context);
                    });

                    return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: controller.tictactoe.value.board.length,
                      itemBuilder: (context, index) {
                        return Board(
                          index: index,
                          controller: controller,
                        );
                      },
                    );
                  }),
            ),
            SizedBox(height: 60),
            Container(
              height: 100,
              child: Console(),
            ),
            SizedBox(height: 60),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  launchURL('https://github.com/ikramhasan');
                },
                child: Text(
                  ikram_hasan,
                  style: subtitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
