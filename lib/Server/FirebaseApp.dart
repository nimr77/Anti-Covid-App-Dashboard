import 'dart:async';
import 'dart:html';

import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyFirebaseApp {
  static App? _app;
  static Firestore? _db;
  static Auth? _myAuth;
  static late Storage _storage;
  static Future initFirebase() async {
    try {
      MyAppControllers.packageInfo = await PackageInfo.fromPlatform();
      if (_app == null)
        _app = initializeApp(
            apiKey: "AIzaSyCE5cQL30Gv0eHjmv_lEH4nxuK0hNhbP-Y",
            authDomain: "la-route-des-empires.firebaseapp.com",
            projectId: "la-route-des-empires",
            storageBucket: "la-route-des-empires.appspot.com",
            messagingSenderId: "486431561963",
            appId: "1:486431561963:web:07a305add0f2ad2304c6ae",
            measurementId: "G-3LRY7LXBCV");
    } catch (e) {}
    _db = firestore();
    _myAuth = auth();
    _storage = storage();
    MyAuthServer.init();
  }

  static Firestore? get db => _db;

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
}
