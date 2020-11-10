import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:flutter_project/models/my_navigator.dart';
import 'package:flutter_project/widgets/button_widget.dart';
import 'package:flutter_project/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size_width = MediaQuery.of(context).size.width;
    // final  bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<LoginModel>(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Global.darkWhite,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: size_width * .5,
              color: Global.white,
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
                            /*Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFieldWidget(
                          hintText: 'Username',
                          obscureText: false,
                          prefixIconData: Icons.person,
                          suffixIconData: model.isValid ? Icons.check : null,
                          onChanged: (value) {
                            model.isValidUsername(value);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextFieldWidget(
                              hintText: 'Password',
                              obscureText: model.isVisible ? false : true,
                              prefixIconData: Icons.lock,
                              suffixIconData: model.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Global.darkBGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              onClick: () => MyNavigator.goToHome(context),
                              title: 'Login',
                              hasBorder: false,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            ButtonWidget(
                              onClick: () => _showMyDialog(),
                              title: 'Exit',
                              hasBorder: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit'),
          titleTextStyle: TextStyle(color: Global.darkRed, fontSize: 20),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Close the application.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Global.darkRed),
              ),
              onPressed: () {
                exit(0);
              },
            ),
            TextButton(
              child: Text(
                'CANCEL',
                style: TextStyle(color: Global.darkBGrey),
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
