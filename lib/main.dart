import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tic_tac_toe/pages/intro_page.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/widgets/dot_back.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Colors.grey[900],
          child: DotBackground(),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.grey[900],
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
