import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/widgets/pageview_widget.dart';
import 'package:flutter_project/widgets/side_layout_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SideLayout(),
            VerticalDivider(thickness: 2, width: 1),
            // This is the main content.

            Expanded(
              child: PageViewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
