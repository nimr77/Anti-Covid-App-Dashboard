abstract class Controller<T> {
  final T value;
  bool? isLoading;
  Future<bool> save();
  Future<bool> delete();
  Controller(this.value);

  static List<Map<String, List>> fromMapToListKeywords(Map data,
      {int setMaxInList = 10}) {
    List<Map<String, List>> r = <Map<String, List>>[];
    data.forEach((key, value) {
      r.add(<String, List>{
        key: [
          for (final x in value.toLowerCase().split(' ').sublist(
              0,
              value.toLowerCase().split(' ').length > setMaxInList
                  ? setMaxInList
                  : value.toLowerCase().split(' ').length))
            x
        ]
      });
    });
    return r;
  }
}
