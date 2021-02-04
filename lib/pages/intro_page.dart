import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:tic_tac_toe/constants/k_text.dart';
import 'package:tic_tac_toe/pages/home/home_page.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';
import 'package:tic_tac_toe/widgets/dot_back.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

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
          DotBackground(),
          Positioned(
            top: size.height / 2 - 250,
            left: size.width / 2 - (isMobile ? 150 : 200),
            child: GlassmorphicContainer(
              height: 500,
              width: isMobile ? 300 : 400,
              border: 2,
              blur: 2,
              borderRadius: 8,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0FFFF).withOpacity(0.2),
                  Color(0xFF0FFFF).withOpacity(0),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0FFFF).withOpacity(1),
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
        ],
      ),
    );
  }
}
