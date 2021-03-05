class MyNearbyUser {
  String id;
  Map<String, double> lastDetect;
  List<_MyNearbyScanned> myScanned = <_MyNearbyScanned>[];

  MyNearbyUser(this.id, {this.lastDetect});

  MyNearbyUser.withList(this.id, this.myScanned);

  static List<MyNearbyUser> myUsers = <MyNearbyUser>[];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> R = {"UserId": id, 'lastDetect': this.lastDetect};
    final myScannedMap = <Map<String, dynamic>>[];
    myScanned.forEach((element) {
      myScannedMap.add(element.toMap());
    });
    R.addAll({"MyScanned": myScannedMap});
    return R;
  }

  ///this will create object from map data
  static MyNearbyUser fromMap(Map input) =>
      MyNearbyUser.withList(input["userId"], input["MyScanned"]);

  ///Note that we use this to load the data from the file
  static fromListMap(List input) {
    input.forEach((element) {
      myUsers.add(MyNearbyUser.fromMap(element));
    });
  }

  ///this will get the data as list map
  static List<Map> getListMap() {
    final R = <Map<String, dynamic>>[];
    myUsers.forEach((element) {
      R.add(element.toMap());
    });
    return R;
  }
}

///this the number of scanned that been done for a user
///[location] is can be spilt with (,)
class _MyNearbyScanned {
  String location;
  String distance;
  String whenBeenScanned;
  int forHowLong;
  _MyNearbyScanned(this.location, this.distance) {
    whenBeenScanned = DateTime.now().toString();
  }

  Map<String, dynamic> toMap() => {
        "location": location,
        "distance": distance,
        "whenBeenScanned": whenBeenScanned,
        'forHowLong': forHowLong
      };
}
