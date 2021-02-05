import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/styles/k_textstyles.dart';

showWinDialog(winText, controller, context) {
  return Get.dialog(
    Center(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          height: 200,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  winText,
                  style: GoogleFonts.vt323(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: winText == 'You Lost!'
                        ? Colors.redAccent
                        : Colors.greenAccent,
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
}
