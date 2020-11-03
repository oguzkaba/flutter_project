import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Text('About Page',
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