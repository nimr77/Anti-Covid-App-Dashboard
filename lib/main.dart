import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Pages/IndexingPage.dart';

import 'Routes/Paths.dart';
import 'Style/MyTextStyle.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp() {
  //   // MyFirebaseApp.initApp();
  //   MenuItemSmall.initMenu();
  // }
  @override
  Widget build(BuildContext context) => MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        // home: MyLoadingPage(),
        initialRoute: IndexingPage.route,
        onGenerateRoute: MyRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: "Dashboard",
        color: Colors.purple[700],
        navigatorKey: MyAppControllers.appNavigator,
        theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.deepOrange[800],
            textTheme: TextTheme(
              headline3: MyTextStyle.simpleTitleTextStyle(
                  myColor: Colors.black87, fontSize: 20),
            )),
      );
}
