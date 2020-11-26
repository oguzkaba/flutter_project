import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/database_helper.dart';
import 'package:flutter_project/data/shared_pref_func.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:flutter_project/models/my_navigator.dart';
import 'package:flutter_project/widgets/button_widget.dart';
import 'package:flutter_project/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DatabaseOperations _operations = new DatabaseOperations();
  String name, pass;
  bool checkVal = false;
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<LoginModel>(context);
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Global.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: sizeWidth * .5,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_full_low_height.png',
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  buildFormLogin(model, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form buildFormLogin(LoginModel model, BuildContext context) {
    return Form(
      key: model.formKey,
      // ignore: deprecated_member_use
      autovalidate: model.autoValidate,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextFormFieldWidget_username(model),
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                buildTextFormFieldWidget_pass(model),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Global.dark),
                          child: Checkbox(
                            activeColor: Global.dark,
                            value: checkVal,
                            onChanged: (bool value) {
                              setState(() {
                                checkVal = value;
                                model.isRemember = checkVal;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember Me?',
                          style: TextStyle(
                              color: Global.dark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {},
                      textColor: Global.dark,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Global.dark,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  onClick: () async {
                    if (model.formKey.currentState.validate()) {
                      model.formKey.currentState.save();
                      bool process = await _operations.loginQuery(
                          name: model.uname, pass: model.password);
                      print('durum' + process.toString());
                      if (process) {
                        //MyNavigator.goToHome(context, model.uname);//with arguments
                        MyNavigator.goToHome(context);
                        print('Sign in successfully' + process.toString());
                        model.isLogin = true;
                        setLogin(model.uname);
                      } else {
                        model.autoValidate = true;
                        model.isLogin = false;
                        print('Failed to sign in');
                        _showMyDialog(
                          'Warning',
                          'Username or password  is wrong.',
                          'Or not registered in the system',
                          'HELP',
                          'OK',
                          () {
                            MyNavigator.gotoLoginHelp(context);
                          },
                        );
                      }
                    }
                  },
                  title: 'Login',
                  hasBorder: false,
                ),
                SizedBox(
                  width: 50.0,
                ),
                ButtonWidget(
                  onClick: () => _showMyDialog(
                    'Exit',
                    'Close the application.',
                    'Would you like to approve of this message?',
                    'OK',
                    'CANCEL',
                    () {
                      exit(0);
                    },
                  ),
                  title: 'Exit',
                  hasBorder: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormFieldWidget buildTextFormFieldWidget_username(LoginModel model) {
    return TextFormFieldWidget(
      focus: true,
      hintText: 'Username',
      obscureText: false,
      prefixIconData: Icons.person,
      //*suffixIconData: model.isValid ? Icons.check : null,//TODO- username sağ tik
      validator: model.validateUname,
      onChanged: (value) => model.onSavedUname(value),
    );
  }

  TextFormFieldWidget buildTextFormFieldWidget_pass(LoginModel model) {
    return TextFormFieldWidget(
      focus: false,
      hintText: 'Password',
      obscureText: model.isVisible ? false : true,
      prefixIconData: Icons.lock,
      suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
      validator: model.validatePassword,
      onChanged: (value) => model.onSavedPassword(value),
    );
  }

  Future<void> _showMyDialog(
      title, text1, text2, tbtn1, tbtn2, Function onPressed) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          titleTextStyle: TextStyle(color: Global.dark_red, fontSize: 30),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  text1,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  text2,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                tbtn1,
                style: TextStyle(color: Global.dark_red, fontSize: 20),
              ),
              onPressed: onPressed,
            ),
            TextButton(
              child: Text(
                tbtn2,
                style: TextStyle(color: Global.dark, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
