import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';
import 'package:fst_anti_covid_project/Pages/LoadingPage.dart';

class Path {
  const Path(this.pattern, this.builder);

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
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}
