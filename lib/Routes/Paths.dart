import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';
import 'package:fst_anti_covid_project/Pages/IndexingPage.dart';
import 'package:fst_anti_covid_project/Pages/LoadingPage.dart';
import 'package:fst_anti_covid_project/Pages/LoginPage.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';
import 'package:fst_anti_covid_project/Service/FirebaseApp.dart';
import 'package:fst_anti_covid_project/Widgets/Models/Menu.dart';
import 'package:page_transition/page_transition.dart';

class MyRoute {
  const MyRoute(this.pattern, this.builder);
  static String requestedPage = MyUsersPage.route;
  final String pattern;
  final Widget Function(BuildContext, String) builder;
  static List<MyRoute> paths = [
    MyRoute(
      r'^' + MyLoadingPage.route,
      (context, match) => MyLoadingPage(),
    ),
    MyRoute(
      r'^' + MyUsersPage.route,
      (context, match) => MyUsersPage(),
    ),
    MyRoute(
      r'^' + IndexingPage.route,
      (context, match) => IndexingPage(
        whileIndexing: () async {
          await Future.delayed(Duration(milliseconds: 500));
          MenuItemSmall.initMenu();

          if (MyFirebaseApp.app == null) await MyFirebaseApp.initApp();
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
    for (MyRoute path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!);
        String? match =
            (firstMatch!.groupCount == 1) ? firstMatch.group(1) : null;
        if (match == null) {
          match = IndexingPage.route;
        }
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
          if (MyFirebaseApp.app == null) await MyFirebaseApp.initApp();
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
            child: t ?? (child),
            type: PageTransitionType.fade,
            settings: settings,
            duration: Duration(milliseconds: 700),
          ));
        }),
        type: PageTransitionType.fade,
        settings: RouteSettings(name: IndexingPage.route));
  }
}
