import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
          child: GlassmorphicContainer(
            height: 500,
            width: 400,
            border: 2,
            blur: 2,
            borderRadius: 8,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0FFFF).withOpacity(0.15),
                Color(0xFF0FFFF).withOpacity(0),
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0FFFF).withOpacity(1),
                Color(0xFF0FFFF).withOpacity(0),
                Color(0xFF0FFFF).withOpacity(1),
              ],
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
