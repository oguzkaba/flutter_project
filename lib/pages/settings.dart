import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Settings'),
      ),
      body: Center(
        child: Text('Settings Page',
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