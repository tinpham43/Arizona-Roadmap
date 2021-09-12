import 'package:flutter/material.dart';

import 'AboutUs.dart';
import 'CustomListTile.dart';
import 'Favorites.dart';

class SettingsDrawer extends StatelessWidget {
  List<HelpModal> modals = new List<HelpModal>.filled(0, new HelpModal(), growable: true);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.green, Colors.greenAccent])),
            child: Text('Place our app logo here'),
          ),
          CustomListTile(
              Icons.favorite_outline_sharp,
              'Favorites',
              () => {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorites()))
                  }),
          CustomListTile(
              Icons.people_outline_sharp,
              'About Us',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()))
                  }),
          CustomListTile(
              Icons.live_help_sharp,
              'Help',
              () => {
                     //Navigator.push(context,
                         //MaterialPageRoute(builder: (context) => HelpList(modals)))
                  }),
        ],
      ),
    );
  }
}
