import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    // final  bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<LoginModel>(context);
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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

  Form buildFormLogin(
      // GlobalKey<FormState> _formKey,
      LoginModel model,
      BuildContext context) {
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
                  height: 20.0,
                ),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Global.dark,
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
                  onClick: () {
                    if (model.formKey.currentState.validate()) {
                      model.formKey.currentState.save();
                      MyNavigator.goToHome(context,model.uname);
                      print('Sign in successfully');
                    } else {
                      model.autoValidate = true;
                      print('Failed to sign in');
                    }
                  },
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit'),
          titleTextStyle: TextStyle(color: Global.dark_red, fontSize: 30),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Close the application.',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Would you like to approve of this message?',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Global.dark_red, fontSize: 20),
              ),
              onPressed: () {
                exit(0);
              },
            ),
            TextButton(
              child: Text(
                'CANCEL',
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
