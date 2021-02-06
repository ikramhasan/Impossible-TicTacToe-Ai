import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/controllers/tictactoe_controller.dart';

class Console extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GetX<TicTacToeController>(
          init: TicTacToeController(),
          builder: (controller) {
            List<int> steps = controller.tictactoe.value.steps;
            return Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                reverse: false,
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  try {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  } catch (e) {
                    print(e);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: RichText(
                      text: TextSpan(
                        text: '> Console: ',
                        style: GoogleFonts.inconsolata(
                          color: Colors.blueAccent,
                        ),
                        children: [
                          TextSpan(
                            text: steps[index] != 0
                                ? 'Checked ${steps[index].toString()} steps ahead and found the most optimal move.'
                                : 'Game started! (the first move may take some time to register.)',
                            style: GoogleFonts.inconsolata(
                              color: steps[index] != 0
                                  ? Colors.greenAccent
                                  : Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
