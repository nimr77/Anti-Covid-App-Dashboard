class MySearchInMap {
  //This will search in this map and set the search
  static Map searchIn(String word, Map source) {
    Map R = new Map();
    if (word == null || word.isEmpty) return source;
    source.forEach((key, value) {
      print(value.toString());
      if (areThoseTextsAreTheSame(word, value.toString()))
        R.addAll({key: source[key]});
    });
    return R;
  }

  ///This will check if both texts are the same in 50 percent
  static bool areThoseTextsAreTheSame(
    String source,
    String second,
  ) {
    String R1 = source.toUpperCase();
    String R = second.toUpperCase();
    int h = 0;
    int max = R.length > R1.length ? R.length : R1.length;
    for (int i = 0; i < max; i++) {
      try {
        if (String.fromCharCode(R1.codeUnitAt(i)) ==
            String.fromCharCode(R.codeUnitAt(i))) {
          h++;
          if (h > (R1.length * 0.5)) return true;
        }
      } catch (e) {
        if (h > (R1.length * 0.2)) return true;
      }
    }
    return false;
  }

  ///This will check if the refrunce is existe in the orders that are in the store
  // static bool getIfThisRefrenceInTheStore(String ref) {
  //   for (var item in Order.listOfMe) {
  //     try {
  //       for (var order in item.subOrder) {
  //         try {
  //           if (order["Reference"] ==
  //               MyValidators.removeAllLettersFromString(ref)) {
  //             return true;
  //           }
  //         } catch (e) {}
  //       }
  //     } catch (e) {}
  //   }

  //   return false;
  // }
}
