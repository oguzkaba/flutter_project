import 'package:flutter/material.dart';
import 'package:flutter_project/mainPage.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:6),
    (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/images/splash_logo.gif"),
             fit: BoxFit.none,             //fit: BoxFit.cover,
           )
         ),
       ),
    );
  }
}
