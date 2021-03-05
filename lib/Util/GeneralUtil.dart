import 'package:flutter/material.dart';

///This will Contain all the general util for more control on the coding of the app
class MyUtil {
  static double getContextHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getContextWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}