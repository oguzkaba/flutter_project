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
  SharedPreferences _pref;

  String get uname => _uname;
  String get password => _password;
  bool get autoValidate => _autoValidate;
  bool get isVisible => _isVisible;
  bool get isLogin => _isLogin;
  bool get isRemember => _isRemember;

  void set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  void set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

//Login remember shared pref begin-----
  void set isRemember(bool value) {
    _isRemember = value;
    if (_isRemember) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    notifyListeners();
    print('Model: isRemember' + _isRemember.toString());
    print(_pref.getString('name'));
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setString('name', _uname);
    _pref.setString('pass', _password);
    _pref.setBool('login', _isLogin);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _uname = _pref.getString('name');
    _password = _pref.getString('pass');
    _isLogin = _pref.getBool('login');
    notifyListeners();
  }

  _deleteFromPrefs() async {
    await _initPrefs();
    _pref.setString('name', '');
    _pref.setString('pass', '');
    _pref.setBool('login', null);
    notifyListeners();
  }


  void set isLogin(bool value) {
    _isLogin = value;
    if (_isLogin) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    notifyListeners();
    print('Model: isLogin' + _isLogin.toString());
    //print(_pref.getString('name'));
    notifyListeners();
  }
//Login remember shared pref end-----
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
