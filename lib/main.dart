import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/LoadingPage.dart';
import 'Routes/Paths.dart' as routes;
import 'Service/FirebaseApp.dart';
import 'Style/MyTextStyle.dart';
import 'Widgets/Models/Menu.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> myStateNavigator =
      GlobalKey<NavigatorState>();
  MyApp() {
    MyFirebaseApp.initApp();
    MenuItemSmall.initMenu();
  }
  @override
  Widget build(BuildContext context) => MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        // home: MyLoadingPage(),
        initialRoute: MyLoadingPage.route,
        onGenerateRoute: routes.Path.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: "Dashboard",
        color: Colors.purple[700],
        navigatorKey: myStateNavigator,
        theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.deepOrange[800],
            textTheme: TextTheme(
              headline3: MyTextStyle.simpleTitleTextStyle(
                  myColor: Colors.black87, fontSize: 20),
            )),
      );
}
