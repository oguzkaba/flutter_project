import 'package:flutter/material.dart';

class MyNavigator {
  //With arguments
  // static void goToHome(BuildContext context,username) {
  //   Navigator.pushReplacementNamed(context, "pages/home",arguments: username);
  // }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "pages/home");
  }

  static void goToAbout(BuildContext context) {
    Navigator.pushNamed(context, "pages/about");
  }

  static void goToSettings(BuildContext context) {
    Navigator.pushNamed(context, "pages/settings");
  }

  static void gotoLoginHelp(BuildContext context) {
    Navigator.pushNamed(context, "pages/login_help");
  }

  static void gotoLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "pages/login");
  }
}
