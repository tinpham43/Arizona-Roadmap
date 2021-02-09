import 'package:flutter/material.dart';
import 'BottomNav.dart';
import 'GMaps.dart';
import 'SettingsDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Arizona RoadMap'),
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _visible = true;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          GMaps(_toggle),
        ],
      ),
      endDrawer: SizedBox(
        width: 175.0,
        child: SettingsDrawer(),
      ),
      bottomNavigationBar: bottomNav(context, _visible, _scaffoldKey, "first"),
    );
  }
}