import 'package:flutter/material.dart';

class MyStyles {
  static List<Color> myHomePageGradColors = [
    Color.fromRGBO(24, 81, 172, 1),
    Color.fromRGBO(52, 37, 162, 1),
    Color.fromRGBO(46, 12, 155, 1),
    Color.fromRGBO(0, 22, 131, 1)
  ];
  static LinearGradient getHomeGradientColor() => LinearGradient(
      begin: FractionalOffset.bottomLeft,
      end: FractionalOffset.topRight,
      colors: myHomePageGradColors,
      stops: [0.3, 01, 0.9, 0.8]);

  static LinearGradient myTextViewGradient() => LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: _myTextViewColors,
      stops: [0.0, 0.5]);
  static List<Color> _myTextViewColors = [
    Color.fromRGBO(255, 255, 255, 0),
    Color.fromRGBO(0, 0, 0, 0.4),
  ];
}
