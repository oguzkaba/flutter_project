import 'package:flutter/material.dart';
import 'package:flutter_project/models/globals.dart';
import 'package:flutter_project/models/login_model.dart';
import 'package:flutter_project/models/page_model.dart';
import 'package:provider/provider.dart';

class SideLayout extends StatefulWidget {
  Function click;

  SideLayout({Key key, this.click}) : super(key: key);

  @override
  _SideLayoutState createState() => _SideLayoutState();
}

class _SideLayoutState extends State<SideLayout> {
  int _selectedIndex = 0;
  bool _extended = false;

  List<IconData> icons = [
    Icons.home,
    Icons.check_circle_outline,
    Icons.menu,
    Icons.warning_rounded,
    Icons.swap_horiz,
    Icons.local_shipping,
    Icons.settings,
    Icons.logout
  ];

  List<String> titles = [
    'MainPage',
    'Approval',
    'Materials',
    'NDT',
    'Release',
    'Ship',
    'Settings',
    'LOGOUT'
  ];

  @override
  Widget build(BuildContext context) {
    final model1 = Provider.of<PageModel>(context);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: NavigationRail(
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _extended = !_extended;
                    });
                  },
                  child: _extended
                      ? Icon(
                          Icons.menu_open,
                          size: 30,
                          color: Global.focusedBlue,
                        )
                      : Icon(Icons.menu, size: 30),
                ),
                leading: Column(
                  children: [
                    Image.asset('assets/images/logo_min_home.png', width: 40),
                  ],
                ),
                extended: _extended,
                minExtendedWidth: 170,
                groupAlignment: -1,
                selectedIndex: _selectedIndex,
                selectedIconTheme: IconThemeData(color: Global.focusedBlue),
                selectedLabelTextStyle: TextStyle(color: Global.focusedBlue),
                onDestinationSelected: (int index) {
                  if (index != _selectedIndex)
                    setState(() {
                      _selectedIndex = index;
                      model1.onSavedIndex(index);
                      print('MenuSelect: ' + _selectedIndex.toString());
                    });
                },
                labelType: NavigationRailLabelType.none,
                destinations: [
                  for (var i = 0; i < titles.length; i++)
                    NavigationRailDestination(
                        icon: Icon(icons[i]), label: Text(titles[i])),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
