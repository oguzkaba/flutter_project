import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Color primaryColor = Colors.blueGrey;
List _menuTabTitle = [
  'MAIN',
  'APPROVAL',
  'MATERIALS',
  'NDT',
  'RELEASE',
  'SHIP'
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryColor,
            title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              // child: _oneSystemAppbar(),
            ),
            actions: [
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 6.0,
                onTap: (index) {
                  setState(() {
                    switch (index) {
                      case 0:
                        primaryColor = Colors.blueGrey;
                        break;
                      case 1:
                        primaryColor = Color(0xff3f51b5);
                        break;
                      case 2:
                        primaryColor = Color(0xffe91e63);
                        break;
                      case 3:
                        primaryColor = Color(0xff9c27b0);
                        break;
                      case 4:
                        primaryColor = Color(0xff2196f3);
                        break;
                      case 5:
                        primaryColor = Colors.brown[600];
                        break;
                      default:
                    }
                  });
                },
                tabs: List.generate(_menuTabTitle.length, (index) {
                  return Tab(
                    child: Container(
                      child: Text(
                        _menuTabTitle[index].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

Widget _oneSystemAppbar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: null,
          ),
        ),
        Container(
          child: Text(
            'Search Area...',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.microphone,
                color: Colors.blueGrey,
              ),
              onPressed: null),
        ),
      ],
    ),
  );
}
