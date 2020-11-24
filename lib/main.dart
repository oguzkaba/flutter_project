import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/pages/about.dart';
import 'package:flutter_project/pages/login.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:provider/provider.dart';
import 'models/login_model.dart';

var routes = <String, WidgetBuilder>{
  "pages/home": (BuildContext context) => HomePage(),
  "pages/about": (BuildContext context) => AboutPage(),
  "pages/settings": (BuildContext context) => SettingsPage(),
};
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: routes,
      ),
    );
  }
}


    
    
  

