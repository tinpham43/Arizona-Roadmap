import 'package:flutter/material.dart';
import 'BottomNav.dart';
import 'SettingsDrawer.dart';
import 'package:firebase_database/firebase_database.dart';

class ThirdPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  final List<String> campName = <String>[
    'Fossil Creek',
    'Camp Verde Hot Springs',
    'Rim Road',
    'Lake Mead - Bullhead City',
    'Highway 89A'
  ];
  final List<String> tempLocation = <String>[
    'Sedona',
    'Sedona',
    'Coconino',
    'Bullhead City',
    'Flagstaff'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Placeholder"),
      ),

      //create ListView for easy list, enable separated builder for dividers
      //use lists for length
      body: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: campName.length,
        itemBuilder: (BuildContext context, index) {
          return new Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExpansionTile(
                  title: Text('${campName[index]}'),
                  trailing: Icon(Icons.add_road_outlined),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text('${databaseReference.f}'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      endDrawer: SizedBox(
        width: 175.0,
        child: SettingsDrawer(),
      ),
      bottomNavigationBar: bottomNav(context, true, _scaffoldKey, "third"),
    );
  }

  String readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}