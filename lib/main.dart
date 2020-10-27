import 'package:flutter/material.dart';
import 'package:flutter_project/mainPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int sayac=6;
@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:sayac),
    (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
             child:Image.asset("assets/images/splash_logo.gif",width: MediaQuery.of(context).size.width*.5,)
       ),
    );
  }
}
