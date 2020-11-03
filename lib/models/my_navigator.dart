  
import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "pages/home");
  }

  static void goToAbout(BuildContext context) {
    Navigator.pushNamed(context, "pages/about");
  }
  static void goToSettings(BuildContext context) {
      Navigator.pushNamed(context, "pages/settings");
    }

}