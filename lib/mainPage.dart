import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("İlk Syfamız",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
 
        ),),
      ),
      backgroundColor: Colors.blue[700],
    );
  }
}