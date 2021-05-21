import 'package:firebase/firebase.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Routes/MyRoutes.dart';
import 'package:fst_anti_covid_project/Server/FirebaseApp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAuthServer {
  static const String SPTokenKey = "SPUserToken";
  static User? myUser;

  static void init() {
    myUser = MyFirebaseApp.myAuth!.currentUser;
  }

  static Future<bool> login(String email, String password) async {
    try {
      final res = await MyFirebaseApp.myAuth!
          .signInWithEmailAndPassword(email, password);
      myUser = res.user;
      // save auth token
      final sp = await SharedPreferences.getInstance();
      await sp.setString(SPTokenKey, await res.user!.getIdToken());
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  static Future<bool> autoLogin() async {
    try {
      final sp = await SharedPreferences.getInstance();
      var token = sp.getString(SPTokenKey)!;
      final res = await MyFirebaseApp.myAuth!.signInWithCustomToken(token);
      myUser = res.user;
    } catch (e) {
      return false;
    }
    return true;
  }

  static Future<bool> loginAndNavigate(String email, String password) async {
    if (await login(email, password)) {
      MyAppControllers.appNavigator.currentState!
          .pushReplacementNamed(MyPath.requestedPage!);
      return true;
    }
    return false;
  }
}
