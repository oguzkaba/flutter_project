import 'dart:io';
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
    final size = MediaQuery.of(context).size;
    // final  bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<LoginModel>(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Global.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
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
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: 'Username',
                      obscureText: false,
                      prefixIconData: Icons.person_outline,
                      suffixIconData: model.isValid ? Icons.check : null,
                      onChanged: (value) {
                        model.isValidUsername(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFieldWidget(
                          hintText: 'Password',
                          obscureText: model.isVisible ? false : true,
                          prefixIconData: Icons.lock_outline,
                          suffixIconData: model.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Global.mediumBlue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                   ButtonWidget(
                      onClick: ()=>MyNavigator.goToHome(context),
                      title: 'Login',
                      hasBorder: false,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ButtonWidget(
                      onClick:()=>exit(0),
                      title: 'Exit',
                      hasBorder: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
