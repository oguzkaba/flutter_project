import 'package:flutter/material.dart';
import 'package:flutter_project/models/page_model.dart';
import 'package:flutter_project/pages/about.dart';
import 'package:flutter_project/pages/login.dart';
import 'package:flutter_project/widgets/side_layout_widget.dart';
import 'package:provider/provider.dart';

class PageViewWidget extends StatefulWidget {
  
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  List<dynamic> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final model1 = Provider.of<PageModel>(context);

    return 
      PageView.builder(
    itemBuilder: (BuildContext context, int index) {
      Color color;
      index=model1.pindex;
      print('pageindex: '+model1.pindex.toString());
      if (index ==1) {
        AboutPage();
      } else if (index  == 7) {
        color = Colors.black;
      } else {
        color = Colors.green;
      }
 
      return Container(color: color);
    },
    itemCount: pages.length,
  );
    
  }
}




