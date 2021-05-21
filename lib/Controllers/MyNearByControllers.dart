import 'package:fst_anti_covid_project/Service/FirebaseApp.dart';
import 'package:fst_anti_covid_project/models/MyNeabyUsers.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class NearbyUsersControllers {
  static const MaxIDNumber = "GCWXKUUiplXhvAn1559RMcelrBj2".length;
  static List<MyNearbyScanned> getScannedScannedPerDay(
      MyNearbyUser myNearbyUser,
      {required DateTime when}) {
    return myNearbyUser
        .myScanned()
        .where((element) => element.whenBeenScanned == when.toString())
        .toList();
  }

  static Future<List<MyNearbyUser>> getContactsNearbyForThisUserFromUpload(
      UserUploads userUploads) async {
    // secondtry-413fb Users hvnDDlTguKffCcPekVdooDVlqPe2 data 1614780848816 data ContactsNearby 1 MyScanned 3 whenBeenScanned
    var q = MyFirebaseApp.usersUploadRef
        .child(userUploads.userId)
        .child('${userUploads.when}')
        .child('data')
        .child('ContactsNearby');
    var snap = await q.once('value');
    List dat = snap.snapshot.val();
    dat.forEach((element) {
      var t = element as Map<String, dynamic>;
      MyNearbyUser.listOfMe.add(MyNearbyUser.fromMap(t));
    });
    return MyNearbyUser.listOfMe;
  }

  static Future<List<UserUploads>> getUploadsForUser(MyUser myUser) async {
    myUser.isLoading = true;
    if (getForThisUserUploads(myUser.id).isNotEmpty) {
      myUser.isLoading = false;

      return getForThisUserUploads(myUser.id);
    }
    var q = await MyFirebaseApp.usersUploadRef
        .child(myUser.id)
        .orderByKey()
        .once('value');
    Map data = q.snapshot.val();
    data.forEach((key, element) {
      UserUploads.listOfMe.add(UserUploads(
          when: int.parse(key),
          userId: myUser.id,
          contactsNearby: element['data']['ContactsNearby']));
    });
    myUser.isLoading = false;
    return getForThisUserUploads(myUser.id);
  }

  // this form the current app state
  static List<UserUploads> getForThisUserUploads(String userId) =>
      UserUploads.listOfMe
          .where((element) => element.userId == userId)
          .toList();

  static bool addThisNearByUser(MyNearbyUser myNearbyUser) =>
      myNearbyUser.id.length == MaxIDNumber;

  static Future<MyNearbyUser> reloadThisUserInfoIfNeeded(
      MyNearbyUser myNearbyUser) async {
    // try to get it from the data that are in the app now

    if (myNearbyUser.name == null &&
        MyUser.listOfMe
                .indexWhere((element) => element.id == myNearbyUser.id) !=
            -1) {
      var usr = MyUser.listOfMe
          .firstWhere((element) => element.id == myNearbyUser.id);
      myNearbyUser.name = usr.name;
      myNearbyUser.phoneNumber = usr.phoneNumber;
      myNearbyUser.email = usr.email;
      myNearbyUser.address = usr.address;
    }
    if (myNearbyUser.name == null) {
      var q =
          await MyFirebaseApp.usersInfoRef.child(myNearbyUser.id).once('value');
      Map<String, dynamic> data = q.snapshot.val()['data'];
      myNearbyUser = MyNearbyUser.fromMap(data);
    }
    return myNearbyUser;
  }
}
