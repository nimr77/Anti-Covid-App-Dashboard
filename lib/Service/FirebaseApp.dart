import 'package:firebase/firebase.dart';
import 'package:fst_anti_covid_project/Config/APIKeys.dart';

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
  static final usersRef = db.ref('Users');

  /// this will load the first 30
  static Future loadingUsers([int maxLimit = 30]) async {}
}
