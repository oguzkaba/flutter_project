import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:provider/provider.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final bool focus;
  final Function onChanged;
  final Function validator;

  TextFormFieldWidget(
      {this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged,
      this.focus,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return TextFormField(
      autofocus: focus,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Global.focusedBlue,
      style: TextStyle(
        color: Global.dark,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Global.dark, fontSize: 20.0),
        focusColor: Global.focusedBlue,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.dark, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.focusedBlue, width: 1.3),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 30,
          color: Global.dark,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 20,
            color: Global.light,
          ),
        ),
      ),
    );
  }
}
