import 'package:flutter/material.dart';

class MySnackBars {
  ///This is for showing [showSnackBar] with message
  static void showSnackMessage(
      GlobalKey<ScaffoldState> myScaffoldKey, String message,
      {int forSecond = 3,
      Color backgroundColor = Colors.red,
      Color actionColor = Colors.white,
      Function() onOK}) {
    myScaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      elevation: 4,
      duration: Duration(seconds: forSecond),
      action: SnackBarAction(
          label: "Ok",
          textColor: actionColor,
          onPressed: () {
            myScaffoldKey.currentState.hideCurrentSnackBar();
            if (onOK != null) onOK();
          }),
    ));
  }
}
