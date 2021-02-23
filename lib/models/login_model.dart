import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel with ChangeNotifier {
  String _uname;
  String _password;
  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _isVisible = false;
  bool _isLogin;
  bool _isRemember;
  // ignore: unused_field
  SharedPreferences _pref;

  String get uname => _uname;
  String get password => _password;
  bool get autoValidate => _autoValidate;
  bool get isVisible => _isVisible;
  bool get isLogin => _isLogin;
  bool get isRemember => _isRemember;

  // ignore: avoid_return_types_on_setters
  void set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  // ignore: avoid_return_types_on_setters
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
