import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Welcome !',
        style: TextStyle(
            color: Global.black,
            fontSize: 30,
            fontWeight: FontWeight.w700),
        children: <TextSpan>[
          TextSpan(
            text: '\nWelding tracking dashboard app...',
            style: TextStyle(
                color: Global.medium,
                fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
