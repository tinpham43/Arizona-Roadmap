import 'SearchPage.dart';
import 'ThirdPage.dart';
import 'package:flutter/material.dart';
import 'Detail.dart';
import 'dart:core';

Widget bottomNav(BuildContext context, bool _visible, final _scaffoldKey, String page) {
  return AnimatedContainer(
    height: _visible ? 45.0 : 0,
    duration: Duration(milliseconds: 200),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 0.25, color: Colors.black),
      ),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: page == "first" ? Colors.green : Colors.grey),
          iconSize: 30.0,
          onPressed: () {
            if(page != "first")
              Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.search, color: page == "second" ? Colors.green : Colors.grey),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch(listWords));

            MaterialPageRoute(builder: (context) => SearchPage());
          },
        ),
        IconButton(
          icon: Icon(Icons.account_box_outlined, color: page == "third" ? Colors.green : Colors.grey),
          onPressed: () {
            if(page != "third")
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage())
              );
            else
              Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.settings_sharp, color: Colors.grey),
          onPressed: () {
            _scaffoldKey.currentState.openEndDrawer();
          },
        ),
      ],
    ),
  );
}