import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      curve: Curves.linear,
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('首页'),
          textAlign: TextAlign.center,
          activeColor: Colors.green,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('用户'),
          textAlign: TextAlign.center,
          activeColor: Colors.blue,
        ),
      ],
      onItemSelected: (i) => setState(() => this.index = i),
    );
  }
}
