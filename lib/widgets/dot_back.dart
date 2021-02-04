import 'package:flutter/material.dart';
import 'package:dotfield/dotfield.dart';

class DotBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DotField(
      size: MediaQuery.of(context).size,
      density: 50,
      maxLineLength: 40,
      threshold: 20,
      minSpeed: 10,
      maxSpeed: 10,
    );
  }
}
