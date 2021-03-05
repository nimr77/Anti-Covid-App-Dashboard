import 'package:fst_anti_covid_project/Service/FirebaseApp.dart';
import 'package:fst_anti_covid_project/models/MyNeabyUsers.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class NearbyUsersControllers {
  static List<MyNearbyScanned> getScannedScannedPerDay(
      MyNearbyUser myNearbyUser,
      {DateTime when}) {
    return myNearbyUser
        .myScanned()
        .where((element) => element.whenBeenScanned == when.toString())
        .toList();
  }

  static Future<List<MyNearbyUser>> getContactsNearbyForThisUserFromUpload(
      MyUser myUser, int whatUpload) async {
    // secondtry-413fb Users hvnDDlTguKffCcPekVdooDVlqPe2 data 1614780848816 data ContactsNearby 1 MyScanned 3 whenBeenScanned
    final r = <MyNearbyUser>[];
    var q = MyFirebaseApp.usersRef
        .child(myUser.id)
        .child('data')
        .child('$whatUpload')
        .child('data')
        .child('ContactsNearby');
    var snap = await q.once('value');
    List dat = snap.snapshot.val();
    dat.forEach((element) {
      var t = element as Map;
      MyNearbyUser.listOfMe.add(MyNearbyUser.fromMap(t));
    });
    return null;
  }
}
