import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context).settings.arguments;
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
            title: Text('ONESystem',style: TextStyle(color: Global.dark)),
            actions: [
              CircleAvatar(
                backgroundColor: Global.medium,
                //backgroundImage: ExactAssetImage('assets/images/logo_min_home.png'),
                foregroundColor:Global.dark ,
              ),
              SizedBox(width: 16),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome: ' + username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Global.dark),
                  )),
              SizedBox(width: 16),
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: sizeWidth * .95,
            height: sizeHeight * .8,
            color: Global.white,
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Global.medium,
          ),
        ),
      ),
    );
  }
}
