import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/k_text.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';
import 'package:tic_tac_toe/pages/home/board.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';
import 'package:tic_tac_toe/utils/launch_url.dart';
import 'package:tic_tac_toe/widgets/dot_back.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: DotBackground(),
          ),
          Positioned(
            top: 100,
            left: size.width / 2 - 300,
            child: Text(
              impossible_tictactoe,
              style: headerStyle,
            ),
          ),
          Positioned(
            top: size.height / 2 - 300,
            left: size.width / 2 - 300,
            height: 600,
            width: 600,
            child: GetX<TicTacToeController>(
                init: TicTacToeController(),
                builder: (controller) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    String winText;
                    if (controller.tictactoe.value.winner == 'X') {
                      winText = 'You Won!';
                    } else if (controller.tictactoe.value.winner == 'O') {
                      winText = 'You Lost!';
                    } else {
                      winText = controller.tictactoe.value.winner;
                    }
                    controller.tictactoe.value.winner == 'NONE'
                        ? Container()
                        : Get.dialog(
                            Center(
                              child: Material(
                                child: Container(
                                  height: 200,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 34),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          winText,
                                          style: GoogleFonts.vt323(
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold,
                                            color: winText == 'You Won!'
                                                ? Colors.greenAccent
                                                : Colors.redAccent,
                                          ),
                                        ),
                                        Button3D(
                                          onPressed: () {
                                            controller.clearBoard();
                                            Navigator.pop(context);
                                          },
                                          width: 200,
                                          child: Text(
                                            'Play Again!',
                                            style: playButtonStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                  });

                  return GridView.builder(
                    shrinkWrap: true,
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
            bottom: 100,
            right: size.width / 2 - 300,
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
