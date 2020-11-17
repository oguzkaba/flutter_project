import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final TextEditingController controller;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Global.focusedBlue,
      style: TextStyle(
        color: Global.lightBGrey,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Global.primaryBGrey,fontSize: 20.0),
        focusColor: Global.focusedBlue,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.primaryBGrey,width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.focusedBlue, width: 1.3),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 30,
          color: Global.darkBGrey,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 20,
            color: Global.lightBGrey,
          ),
        ),
      ),
    );
  }
}
