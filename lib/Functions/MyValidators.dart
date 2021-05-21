import 'package:flutter/cupertino.dart';

class MyValidators {
  static String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Enter phone number";
    } else if (!regExp.hasMatch(value)) {
      return "Phone not valid";
    }
    return null;
  }

  //This will check if its a phone number or not
  static bool checkIfPhone(String phone) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phone);
  }

  //This will check if its a  number or not
  static String? onlyNumbers(String thenum) {
    String pattern = r'(^[0-9])';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(thenum)) {
      return null;
    } else {
      return "Only numbers";
    }
  }

  //This will check if its an email or not
  static bool checkIfEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  static bool _checkIfDateTime(String time) =>
      RegExp('\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d(?:\.\d+)?Z?')
          .hasMatch(time);

  static String? checkDate(String time) {
    if (!_checkIfDateTime(time)) return "Not valid text";

    return null;
  }

  static Map<String, String> clearMapFromNull(Map input) {
    Map<String, String> r = Map<String, String>();
    input.forEach((key, value) {
      if (value != null) r.addAll({key: value});
    });
    return r;
  }

  static String printDuration(Duration duration) {
    if (duration.inHours < 24) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      // days
      return "${duration.inDays} ${"Days left"}";
    }
  }

  static double getTextScaleFactor(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.0008;
}
