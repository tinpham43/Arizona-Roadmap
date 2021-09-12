import 'package:flutter/material.dart';
import 'Campsite.dart';

class CampsiteForm extends StatefulWidget {
  final ValueChanged<Campsite> addCampsite;

  CampsiteForm({this.addCampsite});

  @override
  _CampsiteFormState createState() => _CampsiteFormState();
}

class _CampsiteFormState extends State<CampsiteForm> {
  final _formKey = GlobalKey<FormState>();
  final campNameController = TextEditingController();
  final distanceController = TextEditingController();
  final suspensionController = TextEditingController();
  final gravelsizeController = TextEditingController();
  final gravelquanController = TextEditingController();
  final permitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: campNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Campsite name*",
                          hintText: "e.g. Christopher Creek",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter campsite";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: suspensionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Vehicle Suspension*",
                          hintText: "e.g. refer to tooltip",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: distanceController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Distance*",
                          hintText: "e.g. 4",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter distance";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: gravelsizeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Gravel Size",
                          hintText: "e.g. Small, Medium, Large",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: gravelquanController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Gravel Quantity",
                          hintText: "e.g. Light, Moderate, Heavy",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: permitController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Permit",
                          hintText: "e.g. true, false",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                        ),
                        child: Text("Submit Campsite"),
                        onPressed: () {
                          //double lat = double.parse(latController.text);
                          //double lng = double.parse(latController.text);
                          //LatLng pos = new LatLng(lat, lng);

                          Campsite campsite = new Campsite(
                              campNameController.text,
                              distance: int.parse(distanceController.text),
                              gravelSize: gravelsizeController.text,
                              gravelQuantity: gravelquanController.text,
                              suspension: suspensionController.text,
                              permit: permitController.text == 'true',
                              spare: true);

                          this.widget.addCampsite(campsite);

                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
