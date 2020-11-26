import 'package:flutter/material.dart';
import 'package:flutter_project/data/shared_pref_func.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:flutter_project/models/my_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name, password;
  bool login;
  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  void checkIsLogin() async {
    login = await getLogin();
    if (login == null || login == false) {
      print('routing LOADING....');
      MyNavigator.gotoLogin(context);
    } else {
      // return null;
      name = await getUserName();
    }

    setState(() {
      name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context).settings.arguments;
    final model = Provider.of<LoginModel>(context);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.full_light,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, size: 40), // change this size and style
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            iconTheme: IconThemeData(color: Global.medium, size: 40),
            backgroundColor: Global.white,
            title: Text('ONESystem', style: TextStyle(color: Global.dark)),
            actions: [
              CircleAvatar(
                backgroundColor: Global.medium,
                //backgroundImage: ExactAssetImage('assets/images/logo_min_home.png'),
                foregroundColor: Global.dark,
              ),
              SizedBox(width: 16),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome: ' + name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Global.dark),
                  )),
              SizedBox(width: 16),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: Center(
            child: Container(
              width: sizeWidth * .95,
              height: sizeHeight * .8,
              color: Global.white,
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Global.medium,
            child: Column(
              children: [
                FlatButton(
                  onPressed: () {
                    MyNavigator.goToSettings(context);
                  },
                  textColor: Global.dark,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        color: Global.extra_light,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    MyNavigator.gotoLogin(context);
                    model.isLogin = false;
                  },
                  textColor: Global.dark,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Global.extra_light,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      print('çıkış hatası');
      //Fluttertoast.showToast(msg: 'exit_warning');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
