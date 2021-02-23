import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';

class RButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function onClick;

  const RButtonWidget({Key key, this.title, this.color, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      width: MediaQuery.of(context).size.width * .3,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: onClick,
        color: color,
        child: Text(title,style: TextStyle(color: Global.white,fontSize: 18)),
      ),
    );
  }
}
