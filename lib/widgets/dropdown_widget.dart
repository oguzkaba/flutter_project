import 'package:flutter/material.dart';

class Item {
  final String name;
  final Icon icon;
  const Item(this.name, this.icon);
}

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  Item selectedUser;

  List<Item> users = <Item>[
    const Item(
        'Profile',
        Icon(
          Icons.person,
          //color: const Color(0xFF167F67),
        )),
    const Item(
        'Change Password',
        Icon(
          Icons.vpn_key,
        )),
    const Item(
        'Settings',
        Icon(
          Icons.settings,
        )),
    const Item('Logout', Icon(Icons.login_outlined)),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      hint: Text("Oguz KABA"),
      value: selectedUser,
      onChanged: (Item value) {
        setState(() {
          selectedUser = value;
        });
      },
      items: users.map((Item user) {
        return DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              user.icon,
              SizedBox(
                width: 10,
              ),
              Text(
                user.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
