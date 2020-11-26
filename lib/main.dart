import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/pages/about.dart';
import 'package:flutter_project/pages/login.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/login_help.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:provider/provider.dart';
import 'models/login_model.dart';
import 'models/teheme_provider.dart';

var routes = <String, WidgetBuilder>{
  "pages/home": (BuildContext context) => HomePage(),
  "pages/about": (BuildContext context) => AboutPage(),
  "pages/settings": (BuildContext context) => SettingsPage(),
  "pages/login_help": (BuildContext context) => LoginHelpPage(),
  "pages/login": (BuildContext context) => LoginPage(),
};
Future<void> main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(
          create: (context) => LoginModel(),
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.darkTheme ? dark : light,
          home: HomePage(),
          routes: routes,
        );
      }),
    );
  }
}
