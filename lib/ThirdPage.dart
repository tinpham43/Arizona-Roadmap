import 'package:flutter/material.dart';
import 'BottomNav.dart';
import 'SettingsDrawer.dart';

class ThirdPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
        new Container(),
    ],
        title: Text("Placeholder"),
      ),
      endDrawer: SizedBox(
        width: 175.0,
        child: SettingsDrawer(),
      ),
      bottomNavigationBar: bottomNav(context, true, _scaffoldKey, "third"),
    );
  }
}