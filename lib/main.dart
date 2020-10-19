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
    Future.delayed(Duration(seconds:5),
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
             image: AssetImage("assets/splash_back.jpg"),
             fit: BoxFit.cover,
           )
         ),
       ),
    );
  }
}
