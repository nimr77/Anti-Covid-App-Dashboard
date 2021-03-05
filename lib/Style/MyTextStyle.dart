import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle simpleButtonTextStyle(
          {double fontSize = 15, Color myColor = Colors.white}) =>
      TextStyle(
        color: myColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle simpleTitleTextStyle(
          {double fontSize = 24, Color myColor = Colors.white}) =>
      TextStyle(
        color: myColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle simpleBodyTextStyle(
          {double fontSize = 12, Color myColor = Colors.black87}) =>
      TextStyle(
        color: myColor,
        fontSize: fontSize,
      );

  static TextStyle simpleLoadingTextStyle(
          {double fontSize = 20, Color myColor = Colors.black}) =>
      TextStyle(
        color: myColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );
}
