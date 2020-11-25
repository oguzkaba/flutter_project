import 'package:flutter/material.dart';

class LoginHelpPage extends StatefulWidget {
  @override
  _LoginHelpPageState createState() => _LoginHelpPageState();
}

class _LoginHelpPageState extends State<LoginHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Page'),
      ),
      body: Center(
        child: Text('Login Help Page',
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