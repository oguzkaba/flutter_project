import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:provider/provider.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final TextInputAction action;
  final Function onChanged;
  final Function validator;

  TextFormFieldWidget(
      {this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged,
      this.action,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return TextFormField(
      //autofocus: focus,
      textInputAction: action,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Global.focusedBlue,
      style: TextStyle(
        color: Global.dark,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Global.dark, fontSize: 18.0),
        focusColor: Global.focusedBlue,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Global.extra_light, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Global.focusedBlue, width: 1.3),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 25,
          color: Global.dark,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 20,
            color: model.isVisible ? Global.dark : Global.light,
          ),
        ),
      ),
    );
  }
}
