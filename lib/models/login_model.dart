import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginModel with ChangeNotifier {
  String _uname;
  String _password;
  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _isVisible = false;

  String get uname => _uname;
  String get password => _password;
  bool get autoValidate => _autoValidate;
  bool get isVisible => _isVisible;


  void set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  void set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void onSavedUname(String unameStr) {
    _uname = unameStr;
    notifyListeners();
  }

  void onSavedPassword(String passwordStr) {
    _password = passwordStr;
    notifyListeners();
  }

  String validateUname(String value) {
    if (value.length == 0) {
      return 'Please fill username';
    } else if (value.length < 6) {
      return 'Username must be 6 length character';
    } else {
      return null;
      }
    }
  
  String validatePassword(String value) {
    if (value.length == 0) {
      return 'Please fill password';
    } else if (value.length < 6) {
      return 'Password must be 6 length character';
    } else {
      return null;
    }
    }

}
