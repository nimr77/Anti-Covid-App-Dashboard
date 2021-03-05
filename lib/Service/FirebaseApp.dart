import 'package:firebase/firebase.dart';
import 'package:fst_anti_covid_project/Config/APIKeys.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class MyFirebaseApp {
  static String lastUserKey;
  static initApp() {
    initializeApp(
        apiKey: MyAPIKeys.ApiKeys,
        authDomain: "secondtry-413fb.firebaseapp.com",
        databaseURL: "https://secondtry-413fb.firebaseio.com",
        projectId: "secondtry-413fb",
        storageBucket: "secondtry-413fb.appspot.com",
        messagingSenderId: "425353693154",
        appId: "1:425353693154:web:94bc655dae846124415bbb");
  }

  static Database db = database();
  static final _usersRef = db.ref('Users');
  static final usersInfoRef = _usersRef.child('UsersInfo');
  static final usersUploadRef = _usersRef.child('UsersUpload');
  static final usersNotificationsRef = _usersRef.child('UsersNotifications');

  /// this will load the first 30
  static Future loadingUsers([int maxLimit = 30]) async {
    var q = usersInfoRef.limitToFirst(maxLimit);
    if (lastUserKey == null) {
      q = q.startAt(lastUserKey);
    }
    var snap = await q.once('value');
    Map data = snap.snapshot.val();
    data.forEach((key, value) {
      final t = <String, dynamic>{'id': key};
      t.addAll(value);
      MyUser.listOfMe.add(MyUser.fromMap(t));
      lastUserKey = key;
    });
  }
}
