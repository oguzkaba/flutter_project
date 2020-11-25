import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context,username) {
    Navigator.pushNamed(context, "pages/home",arguments: username);
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
}
