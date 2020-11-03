import 'package:flutter/material.dart';
import 'package:flutter_project/pages/about.dart';
import 'package:flutter_project/pages/login.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/settings.dart';

var routes = <String, WidgetBuilder>{
  "pages/home": (BuildContext context) => HomePage(),
  "pages/about": (BuildContext context) => AboutPage(),
  "pages/settings": (BuildContext context) => SettingsPage(),
};

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: routes,
    theme: ThemeData.dark()
      //primaryColor: Colors.blueGrey,
    ),
    );
}



