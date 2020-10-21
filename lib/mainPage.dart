import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("İlk Sayfamız",
        style: TextStyle(
          fontSize: 50,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),),
      ),
      backgroundColor: Colors.white,
    );
  }
}