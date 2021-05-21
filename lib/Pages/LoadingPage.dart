import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';

import '../main.dart';

class MyLoadingPage extends StatelessWidget {
  static String route = "/";
  MyLoadingPage() {
    MyApp.myStateNavigator.currentState!.pushNamed(MyUsersPage.route);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
