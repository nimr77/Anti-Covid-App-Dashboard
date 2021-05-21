import 'package:flutter/cupertino.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Pages/IndexingPage.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';
import 'package:fst_anti_covid_project/Server/FirebaseApp.dart';
import 'package:page_transition/page_transition.dart';

class MyPath {
  static String? requestedPage;
  const MyPath(this.pattern, this.builder);

  final String pattern;
  final Widget Function(BuildContext?, String) builder;
  static List<MyPath> paths = [
    // MyPath(r'^' + IndexingPage.route, (_, __) => IndexingPage()),
  ];
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (MyPath path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final argus = settings.arguments;
        final child = path.builder(
            MyAppControllers.appNavigator.currentContext, argus.toString());
        return navigator(child, argus.toString(), settings);
        // return PageTransition(
        //     child: path.builder(
        //         MyAppControllers.appNavigator.currentContext, argus.toString()),
        //     settings: settings,
        //     duration: Duration(milliseconds: 700),
        //     type: PageTransitionType.fade);
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }

  static Route<dynamic> navigator(
      Widget child, String argus, RouteSettings settings) {
    requestedPage = settings.name;

    return PageTransition(
        child: IndexingPage(whileIndexing: () async {
          // init firebase
          if (MyFirebaseApp.app == null) await MyFirebaseApp.initFirebase();
          Widget? t;
          if (MyAuthServer.myUser == null) {
            await MyAuthServer.autoLogin();
          }
          if (MyAuthServer.myUser == null) {
            // t = LoginPage();
          }
          // t ?? child ?? HomePage()
          // navigate and check
          MyAppControllers.appNavigator.currentState!
              .pushReplacement(PageTransition(
            child: child,
            type: PageTransitionType.fade,
            settings: settings,
            duration: Duration(milliseconds: 700),
          ));
        }),
        type: PageTransitionType.fade,
        settings: RouteSettings(name: IndexingPage.route));
  }
}
