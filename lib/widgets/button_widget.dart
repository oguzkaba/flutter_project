import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Function onClick; 
  
  ButtonWidget({
    this.title,
    this.hasBorder,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 50.0,
        width: MediaQuery.of(context).size.width*.225,
        decoration: BoxDecoration(
          color: hasBorder ? Global.darkRed : Global.darkBGrey,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Global.darkRed,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color:Global.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}