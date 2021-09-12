import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'BottomNav.dart';
import 'SearchPage.dart';
import 'SettingsDrawer.dart';

class GMaps extends StatefulWidget {
  final Function _toggle;
  final bool _visible;

  GMaps(this._toggle, this._visible);

  @override
  _GMapsState createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {
  Completer<GoogleMapController> _control = Completer();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const LatLng _head = const LatLng(34.048927, -111.093735);
  final Set<Marker> _marker = {};
  final Set<Polyline> _polyline = {};
  final Set<Polyline> _polylineOff = {};
  List<LatLng> coordinates = [];
  PolylinePoints polyPoints = PolylinePoints();
  Marker _lastMarker;
  LatLng _lastPosition = _head;
  MapType _mapType = MapType.normal;
  bool _toggleRouting = false;
  bool _rushHour = false;
  bool _morningRushHour = false;
  bool _eveningRushHour = false;
  bool _visible = false;

  @override
  initState() {
    _visible = widget._visible;
    super.initState();
  }

  static final CameraPosition posOne = CameraPosition(
      target: LatLng(33.048927, -111.093735),
      bearing: 192.111,
      tilt: 11.0,
      zoom: 10.0);

  _mapCreated(GoogleMapController controller) {
    _control.complete(controller);
  }

  _cameraMove(CameraPosition position) {
    _lastPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _mapType =
          _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  _onRoutingButtonPressed() {
    setState(() {
      _toggleRouting = !_toggleRouting;
    });
  }

  _changeMarker(LatLng pos) {
    setState(() {
      if (_marker.length > 0) _marker.remove(_lastMarker);
      _marker.add(_lastMarker = Marker(
        markerId: MarkerId(pos.toString()),
        position: pos,
        infoWindow: InfoWindow(title: 'Marker Title', snippet: 'snippet'),
        icon: BitmapDescriptor.defaultMarker,
        draggable: true,
      ));
      _getPolyline();
    });
  }

  _onMarkerButtonPressed() {
    setState(() {
      if (_marker.length > 1) _marker.remove(_lastMarker);
      _marker.add(_lastMarker = Marker(
        markerId: MarkerId(_lastPosition.toString()),
        position: _lastPosition,
        infoWindow: InfoWindow(title: 'Marker Title', snippet: 'snippet'),
        icon: BitmapDescriptor.defaultMarker,
        draggable: true,
      ));
      _getPolyline();
    });
  }

  void _getRushHour() {
    var getTime = new DateTime.now();
    if (getTime.hour >= 6 && getTime.hour <= 9) {
      _morningRushHour = true;
    }
    if (getTime.hour >= 15 && getTime.hour <= 19) {
      _eveningRushHour = true;
    }
    if (_morningRushHour || _eveningRushHour)
      _rushHour = true;
    else
      _rushHour = false;
  }

  _addPolyline() {
    PolylineId id = PolylineId("poly");
    _polyline.add(Polyline(
        polylineId: id,
        color: Colors.red,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
        points: coordinates));
    setState(() {});
  }

  _getPolyline() async {
    _getRushHour();
    PolylineResult result = await polyPoints.getRouteBetweenCoordinates(
      "AIzaSyAP7DdQ-KhPDsk1cBq7XvImwhDayrANsMo",
      PointLatLng(
          _marker.first.position.latitude, _marker.first.position.longitude),
      PointLatLng(
          _marker.last.position.latitude, _marker.last.position.longitude),
      avoidHighways: _rushHour,
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      if (coordinates.isNotEmpty) coordinates.clear();
      result.points.forEach((PointLatLng point) {
        coordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyline();
  }

  Future<void> _goToPosition() async {
    final GoogleMapController controller = await _control.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(posOne));
  }

  @override
  Widget build(BuildContext context) {
    //SearchPage Object
    SearchPage search = new SearchPage(context, changeMarker: _changeMarker);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          SafeArea(
            bottom: false,
            child: GoogleMap(
              onTap: (argument) => {
                _visible = !_visible,
                this.widget._toggle(),
              },
              zoomControlsEnabled: false,
              compassEnabled: true,
              myLocationButtonEnabled: false,
              scrollGesturesEnabled: true,
              onMapCreated: _mapCreated,
              initialCameraPosition: CameraPosition(
                target: _head,
                zoom: 7.0,
                tilt: 2.5,
              ),
              polylines: _toggleRouting ? _polyline : _polylineOff,
              mapType: _mapType,
              markers: _marker,
              onCameraMove: _cameraMove,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              right: false,
              child: AnimatedContainer(
                width: _visible ? 75.0 : 0,
                duration: Duration(milliseconds: 200),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _onMapTypeButtonPressed();
                      },
                      child: Icon(Icons.map_outlined),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _onMarkerButtonPressed();
                      },
                      // onLongPress: () {
                      //  coordinates.clear();
                      // },
                      child: Icon(Icons.post_add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _goToPosition();
                      },
                      child: Icon(Icons.my_location),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _onRoutingButtonPressed();
                      },
                      child: Icon(Icons.alt_route),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: SizedBox(
        width: 175.0,
        child: SettingsDrawer(),
      ),
      bottomNavigationBar: bottomNav(
          context, _visible, _scaffoldKey, "first", search, _changeMarker),
    );
  }
}
