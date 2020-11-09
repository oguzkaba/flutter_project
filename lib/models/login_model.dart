import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'globals.dart';

class LoginModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidUsername(String input) {
    for(var i=0;i<Global.validEmail.length;i++){
      if (input == Global.validEmail[i]) {
        _isValid = true;
      } else {
        _isValid = false;
      }
       
    }
  notifyListeners();   
  }
}