import 'package:flutter/material.dart';

class MyNavigator {
  //With arguments
  // static void goToHome(BuildContext context,username) {
  //   Navigator.pushReplacementNamed(context, "pages/home",arguments: username);
  // }

  static void gotoLogin(BuildContext context) {
    Navigator.pushNamed(context, "pages/login");
  }

  static void goToHome(BuildContext context) {
    //Navigator.pushReplacementNamed(context, "pages/home");
    Navigator.pushNamed(context, "pages/home");
  }

  static void gotoApproval(BuildContext context) {
    Navigator.pushNamed(context, "pages/approval");
  }

  static void gotoMaterials(BuildContext context) {
    Navigator.pushNamed(context, "pages/materials");
  }

  static void gotoNDT(BuildContext context) {
    Navigator.pushNamed(context, "pages/ndt");
  }

  static void gotoRelease(BuildContext context) {
    Navigator.pushNamed(context, "pages/release");
  }

  static void gotoShip(BuildContext context) {
    Navigator.pushNamed(context, "pages/ship");
  }

  static void goToSettings(BuildContext context) {
    Navigator.pushNamed(context, "pages/settings");
  }

  static void goToAbout(BuildContext context) {
    Navigator.pushNamed(context, "pages/about");
  }

  static void gotoLoginHelp(BuildContext context) {
    Navigator.pushNamed(context, "pages/login_help");
  }
}
