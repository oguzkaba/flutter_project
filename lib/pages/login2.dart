import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:flutter_project/models/my_navigator.dart';
import 'package:flutter_project/widgets/rbutton_widget.dart';
import 'package:flutter_project/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class Login2Page extends StatefulWidget {
  @override
  _Login2PageState createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  bool checkVal = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeigth = MediaQuery.of(context).size.height;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomPadding: false,
        backgroundColor: Global.white,
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  //padding: EdgeInsets.only(left: sizeWidth * .05),
                  color: Global.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                            'assets/images/logo_full_low_height.png',
                            height: keyboardOpen ? 0 : 50),
                      ),
                      SizedBox(height: keyboardOpen ? 0 : sizeHeigth * .03),
                      buildFormLogin2(model, context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  color: Global.dark,
                  child: Column(children: [
                    Image.asset(
                      'assets/images/home_right.png',
                      height: sizeHeigth * .96,
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form buildFormLogin2(LoginModel model, BuildContext context) {
    return Form(
      key: model.formKey,
      // ignore: deprecated_member_use
      autovalidate: model.autoValidate,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextFormFieldWidgetUsername(model),
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                buildTextFormFieldWidgetPass(model),
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
                                //model.isRemember = checkVal;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Keep me logged in?',
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RButtonWidget(
                  color: Global.focusedBlue,
                  onClick: () {
                    if (model.formKey.currentState.validate()) {
                      model.formKey.currentState.save();
                      MyNavigator.goToHome(context); //with arguments
                      print('Sign in successfully' + model.uname);
                      //setLogin(model.uname);
                    } else {
                      model.autoValidate = true;
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
                  },
                  title: 'Login',
                ),
                SizedBox(
                  height: 10.0,
                ),
                RButtonWidget(
                  color: Global.medium,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormFieldWidget buildTextFormFieldWidgetUsername(LoginModel model) {
    return TextFormFieldWidget(
      action: TextInputAction.next,
      hintText: 'Username',
      obscureText: false,
      prefixIconData: Icons.person,
      //*suffixIconData: model.isValid ? Icons.check : null,
      validator: model.validateUname,
      onChanged: (value) => model.onSavedUname(value),
    );
  }

  TextFormFieldWidget buildTextFormFieldWidgetPass(LoginModel model) {
    return TextFormFieldWidget(
      action: TextInputAction.done,
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
