import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/my_navigator.dart';


class LoginPage extends StatefulWidget{
 @override
  _LoginPageState createState() => _LoginPageState();
    }
  
  class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(icon:Icon(Icons.brightness_4), onPressed:()=>MyNavigator.goToAbout(context),tooltip: 'About')
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(icon:Icon(Icons.cancel), onPressed:()=> exit(0) ,tooltip: 'Exit')
          ),
        ],
      ),
      body: Center(
        child:Column(children: [
          Text('Login Page',
          style: TextStyle(
          fontSize: 50,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),),
        RaisedButton(
          onPressed:()=>MyNavigator.goToHome(context),
          child: Text('Goto Home'),
          //style: TextStyle(color: Colors.white),),
        )
        ],)  
      ),
      backgroundColor: Colors.white,
    );
  }
}