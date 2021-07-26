import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/bottom_nav_provider.dart';
import 'package:flutter_example/bottom_navy_bar_widget.dart';
import 'package:flutter_example/nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IndexPage()),
      ],
      child: MyApp(),
    ),
    // MyApp()
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int index = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    Text('Messgaes Screen'),
    Text('Profile Screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(context.watch<IndexPage>().getIndex),
      ),
      bottomNavigationBar:
          NavBarWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //底部菜单栏按钮
  // Widget buildBottomNavigation() {
  //   return BottomNavyBar(
  //     curve: Curves.linear,
  //     selectedIndex: index,
  //     items: [
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.apps),
  //         title: Text('首页'),
  //         textAlign: TextAlign.center,
  //         activeColor: Colors.green,
  //       ),
  //       BottomNavyBarItem(icon: Icon(Icons.people), title: Text('用户')),
  //     ],
  //     onItemSelected: (i) => setState(() => this.index = i),
  //   );
  // }
}
