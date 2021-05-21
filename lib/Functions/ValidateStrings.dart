import 'package:flutter/cupertino.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';

class MyValidatorString {
  ///this will remove the dot from the string
  static String RemoveDot(String Text) {
    String R1 = Text.toUpperCase();
    String R = "";
    for (int i = 0; i < R1.length; i++) {
      if (String.fromCharCode(R1.codeUnitAt(i)) != ".") {
        R += String.fromCharCode(R1.codeUnitAt(i));
      }
    }
    return R;
  }

  static String removeAllLettersFromString(String input) {
    String R1 = input.toUpperCase();
    String R = "";
    for (int i = 0; i < R1.length; i++) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
          .hasMatch(String.fromCharCode(R1.codeUnitAt(i)))) {
        R += String.fromCharCode(R1.codeUnitAt(i));
      }
    }
    return R;
  }

  static String showTime(DateTime time) => ' ${time.hour}:${time.minute}';
  static String showGoodTime(DateTime time) =>
      '${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}';

  static String listObjectWithNumber(List<String> objects) {
    String r = "";
    for (int index = 0; index < objects.length; index++) {
      r += " ${index + 1}: ${objects[index]}";
    }
    return r;
  }

  static String getPrice(double? price) {
    return "$price.00DH";
  }

  static double getTextScaleFactor(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.0005 +
      MediaQuery.of(context).textScaleFactor * 0.05;

  static String listToIndexList(List list) {
    String r = "";
    for (int i = 0; i < list.length; i++) {
      r += " $i: ${list[i]}";
    }
    return r;
  }

  static String? getObjectLangTextFromLang(Map text) {
    try {
      String? r = text.values.toList()[0];
      if (text.keys.contains(MyAppControllers.ln))
        r = text[MyAppControllers.ln];
      return r;
    } catch (e) {
      return "";
    }
  }
}
