import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/home/home_page.dart';
import 'package:tic_tac_toe/pages/intro_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Impossible TicTacToe',
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.grey[900],
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}
