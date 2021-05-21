import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fst_anti_covid_project/Controllers/MyAppControllers.dart';
import 'package:fst_anti_covid_project/Server/AuthServer.dart';

class LoginPage extends StatefulWidget {
  static const route = "Login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterLogin(
          theme: LoginTheme(
            pageColorLight: Colors.white,
          ),
          logo: "assets/icon.png",
          onSignup: (_) {},
          onLogin: (loginData) => Future<String?>(() async {
            if (await MyAuthServer.loginAndNavigate(
                loginData.name, loginData.password)) {
              return null;
            }
            return "Error with login, please enter a valid email and password";
          }),
          onRecoverPassword: (_) {},
          hideSignUpButton: true,
          hideForgotPasswordButton: true,
        ),
        if (MyAppControllers.packageInfo != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("version ${MyAppControllers.packageInfo!.version}"),
            ),
          )
      ],
    );
  }
}
