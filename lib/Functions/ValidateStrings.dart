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

  ///This will check if the types contains any increment value
  static bool containsIncrementValue(List<Map> myType) {
    for (var t in myType) {
      if (t["Prix"] != null &&
          t["Prix"] < 35 &&
          t["Nom"] != "Séchage seul" &&
          t["Nom"] != "Livraison") {
        return true;
      }
    }
    return false;
  }

  static String showTime(DateTime time) => ' ${time.hour}:${time.minute}';
  static String showGoodTime(DateTime time) =>
      '${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}';
}
