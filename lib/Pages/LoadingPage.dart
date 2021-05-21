import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';

class MyLoadingPage extends StatelessWidget {
  static String route = "/";
  MyLoadingPage() {
    MyAppControllers.appNavigator.currentState!.pushNamed(MyUsersPage.route);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
