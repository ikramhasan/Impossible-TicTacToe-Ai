import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/k_text.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';
import 'package:tic_tac_toe/pages/home/board.dart';
import 'package:tic_tac_toe/pages/home/console.dart';
import 'package:tic_tac_toe/pages/home/win_dialog.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';
import 'package:tic_tac_toe/utils/launch_url.dart';
import 'package:tic_tac_toe/widgets/dot_back.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobile = false;
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        isMobile = true;
      }
    } catch (e) {
      print(e);
    }

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: DotBackground(),
          ),
          Positioned(
            top: 100,
            left: isMobile ? size.width / 2 - 150 : size.width / 2 - 300,
            child: Text(
              impossible_tictactoe,
              style: headerStyle,
            ),
          ),
          Positioned(
            top: size.height / 2 - (isMobile ? 150 : 300),
            left: size.width / 2 - (isMobile ? 150 : 300),
            height: isMobile ? 300 : 600,
            width: isMobile ? 300 : 600,
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
          Positioned(
            top: size.height / 2 + (isMobile ? 180 : 320),
            right: isMobile ? size.width / 2 - 150 : size.width / 2 - 300,
            height: isMobile ? 80 : 60,
            width: isMobile ? 300 : 600,
            child: Console(),
          ),
          Positioned(
            top: size.height / 2 + (isMobile ? 300 : 400),
            right: isMobile ? size.width / 2 - 150 : size.width / 2 - 300,
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
    );
  }
}
