import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';
import 'package:fst_anti_covid_project/Pages/IndexingPage.dart';
import 'package:fst_anti_covid_project/Pages/LoadingPage.dart';
import 'package:fst_anti_covid_project/Pages/LoginPage.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';
import 'package:fst_anti_covid_project/Server/FirebaseApp.dart';
import 'package:page_transition/page_transition.dart';

class Path {
  const Path(this.pattern, this.builder);
  static String requestedPage = MyUsersPage.route;
  final String pattern;
  final Widget Function(BuildContext, String) builder;
  static List<Path> paths = [
    Path(
      r'^' + MyLoadingPage.route,
      (context, match) => MyLoadingPage(),
    ),
    Path(
      r'^' + MyUsersPage.route,
      (context, match) => MyUsersPage(),
    ),
    Path(
      r'^' + IndexingPage.route,
      (context, match) => IndexingPage(
        whileIndexing: () async {
          await Future.delayed(Duration(milliseconds: 500));
          if (MyFirebaseApp.app == null) await MyFirebaseApp.initFirebase();
          Widget? t;
          if (MyAuthServer.myUser == null) {
            await MyAuthServer.autoLogin();
          }
          if (MyAuthServer.myUser == null) {
            t = LoginPage();
          }
          MyAppControllers.appNavigator.currentState!
              .pushReplacement(PageTransition(
            child: t ?? MyUsersPage(),
            type: PageTransitionType.fade,
            settings: RouteSettings(name: IndexingPage.route),
            duration: Duration(milliseconds: 700),
          ));
        },
      ),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget child;
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!);
        final match =
            (firstMatch!.groupCount == 1) ? firstMatch.group(1) : null;

        child =
            path.builder(MyAppControllers.appNavigator.currentContext!, match!);
        break;
      }
    }
    return navigator(child, settings);
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
  }

  static Route<dynamic> navigator(Widget child, RouteSettings settings) {
    requestedPage = settings.name!;

    return PageTransition(
        child: IndexingPage(whileIndexing: () async {
          // init firebase
          if (MyFirebaseApp.app == null) await MyFirebaseApp.initFirebase();
          Widget? t;
          if (MyAuthServer.myUser == null) {
            await MyAuthServer.autoLogin();
          }
          if (MyAuthServer.myUser == null) {
            t = LoginPage();
          }
          // navigate and check
          MyAppControllers.appNavigator.currentState!
              .pushReplacement(PageTransition(
            child: t ?? (child ?? MyUsersPage()),
            type: PageTransitionType.fade,
            settings: settings,
            duration: Duration(milliseconds: 700),
          ));
        }),
        type: PageTransitionType.fade,
        settings: RouteSettings(name: IndexingPage.route));
  }
}
