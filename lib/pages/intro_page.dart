import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/k_text.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';

import 'home/home_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
        child: Center(
          child: Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 34,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      impossible_tictactoe,
                      style: headerStyle,
                    ),
                    Text(
                      game_description,
                      style: bodyTextStyle,
                    ),
                    Button3D(
                      onPressed: () {
                        Get.to(HomePage());
                      },
                      width: 200,
                      child: Text(
                        play,
                        style: playButtonStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
