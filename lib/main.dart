import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/pages/about.dart';
import 'package:flutter_project/pages/approval.dart';
import 'package:flutter_project/pages/login.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/login2.dart';
import 'package:flutter_project/pages/login_help.dart';
import 'package:flutter_project/pages/materials.dart';
import 'package:flutter_project/pages/ndt.dart';
import 'package:flutter_project/pages/release.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:flutter_project/pages/ship.dart';
import 'package:provider/provider.dart';
import 'models/login_model.dart';
import 'models/page_model.dart';
import 'models/teheme_provider.dart';

var routes = <String, WidgetBuilder>{
  "pages/login": (BuildContext context) => LoginPage(),
  "pages/home": (BuildContext context) => HomePage(),
  "pages/approval": (BuildContext context) => ApprovalPage(),
  "pages/materials": (BuildContext context) => MaterialsPage(),
  "pages/ndt": (BuildContext context) => NDTPage(),
  "pages/release": (BuildContext context) => ReleasePage(),
  "pages/ship": (BuildContext context) => ShipPage(),
  "pages/settings": (BuildContext context) => SettingsPage(),
  "pages/about": (BuildContext context) => AboutPage(),
  "pages/login_help": (BuildContext context) => LoginHelpPage(),
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
        ChangeNotifierProvider<PageModel>(
          create: (_) => PageModel(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.darkTheme ? dark : light,
          home: Login2Page(),
          routes: routes,
        );
      }),
    );
  }
}
