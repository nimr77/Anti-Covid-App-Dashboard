import 'dart:io';

import 'package:firebase/firebase.dart';
import 'package:fst_anti_covid_project/Config/APIKeys.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class MyFirebaseApp {
  static App? _app;
  static Auth? _myAuth;
  static late Storage _storage;
  static initApp() {
    try {
      _app = initializeApp(
          apiKey: ApiKeys,
          authDomain: "secondtry-413fb.firebaseapp.com",
          databaseURL: "https://secondtry-413fb.firebaseio.com",
          projectId: "secondtry-413fb",
          storageBucket: "secondtry-413fb.appspot.com",
          messagingSenderId: "425353693154",
          appId: "1:425353693154:web:94bc655dae846124415bbb");
    } catch (e) {}
    _myAuth = auth();
    _storage = storage();
    MyAuthServer.init();
  }

  static Database db = database();
  static final _usersRef = db.ref('Users');
  static final usersInfoRef = _usersRef.child('UsersInfo');
  static final usersUploadRef = _usersRef.child('UsersUpload');
  static final usersNotificationsRef = _usersRef.child('UsersNotifications');
  static App? get app => _app;

  static Auth? get myAuth => _myAuth;

  static Future<Uri> uploadFile(String path, File? file) async {
    var up = _storage.ref(path).put(file);
    // create task
    var f = await up.future;
    return await f.ref.getDownloadURL();
  }

  static Future<void> removeFile(String path) async =>
      _storage.ref(path).delete().catchError((e) {
        print(e);
      });

  /// this will load the first 30
  static Future loadingUsers([int maxLimit = 30]) async {
    var q = usersInfoRef.limitToFirst(maxLimit);
    var snap = await q.once('value');
    Map data = snap.snapshot.val();
    data.forEach((key, value) {
      final t = <String, dynamic>{'id': key};
      t.addAll(value['data']);
      MyUser.listOfMe.add(MyUser.fromMap(t));
    });
  }
}
