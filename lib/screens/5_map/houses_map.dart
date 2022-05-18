import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';
import 'dart:async';
import 'dart:convert';

class HouseMap extends StatefulWidget {
  const HouseMap({Key? key}) : super(key: key);

  @override
  State<HouseMap> createState() => _HouseMapState();
}

class _HouseMapState extends State<HouseMap> {
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  Location location = Location();
  late GoogleMapController _mapController;

  _checkLocationPermission() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
      if (!locationServiceEnabled) {
        return;
      }
    }

    PermissionStatus locationForAppStatus = await location.hasPermission();
    if (locationForAppStatus == PermissionStatus.denied) {
      await location.requestPermission();
      locationForAppStatus = await location.hasPermission();
      if (locationForAppStatus != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    _mapController.moveCamera(CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!)));
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    // setState(() {
    //   loadMarkers();
    // })
    ;
  }

  // Future loadMarkers() async {
  //   var jsonData = await rootBundle.loadString('assets/json/coords.json');
  //   var data = json.decode(jsonData);

  //   data["coords"].forEach((item) {
  //     _markers.add(
  //       Marker(
  //           markerId: MarkerId(item["ID"]),
  //           position: LatLng(double.parse(item["latitude"]),
  //               double.parse(item["longitude"])),
  //           infoWindow: InfoWindow(
  //             title: item["comment"],
  //           ),
  //           icon:
  //               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  //     );
  //   });
  //   setState(() {});
  // }

  double zoomVal = 14.0;

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment(0.98, 0.1),
      child: Container(
          width: 45,
          child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: this.dataToMap.bgcolor,
              child: Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                zoomVal--;
                _minus(zoomVal);
              })),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
        alignment: Alignment(0.98, -0.1),
        child: Container(
          width: 45,
          child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: this.dataToMap.bgcolor,
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                zoomVal++;
                _plus(zoomVal);
              }),
        ));
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(54.186415, 37.599950), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(54.186415, 37.599950), zoom: zoomVal)));
  }

  late DataToMap dataToMap;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    dataToMap = settings.arguments as DataToMap;

    final args = ModalRoute.of(context)!.settings.arguments as DataToMap;

    String comment = 'ул. ' + args.streetHouse + ', ' + args.numberHouse;
    Marker houseMarker = Marker(
        markerId: MarkerId(args.itemId),
        position: LatLng(double.parse(args.houseLatitude), args.houseLongitude),
        infoWindow: InfoWindow(
          title: comment,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    return Scaffold(
        appBar: AppBar(
          title: Text("Ул." + args.streetHouse + ", " + args.numberHouse),
          centerTitle: true,
          backgroundColor: this.dataToMap.bgcolor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(args.houseLatitude, args.houseLongitude),
                  zoom: zoomVal,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: {houseMarker},
                zoomControlsEnabled: false),
            _zoomminusfunction(),
            _zoomplusfunction(),
          ],
        ));
  }
}
