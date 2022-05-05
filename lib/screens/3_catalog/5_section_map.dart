import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tos_parkoviy_app/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';

class TOSMap extends StatefulWidget {
  const TOSMap({Key? key}) : super(key: key);

  @override
  State<TOSMap> createState() => _TOSMapState();
}

class _TOSMapState extends State<TOSMap> {
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    setState(() {
      loadMarkers();
    });
  }

  Future loadMarkers() async {
    var jsonData = await rootBundle.loadString('assets/json/coords.json');
    var data = json.decode(jsonData);

    data["coords"].forEach((item) {
      _markers.add(new Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen)));
    });
  }

  int zoomVal = 5;

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment(0.98, 0.1),
      child: Container(
          width: 45,
          child: FloatingActionButton(
              backgroundColor: Color(0xFFf18825),
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
              backgroundColor: Color(0xFFf18825),
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                zoomVal++;
                _plus(zoomVal);
              }),
        ));
  }

  Future<void> _minus(zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(54.195340, 37.620309), zoom: zoomVal)));
  }

  Future<void> _plus(zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(54.195340, 37.620309), zoom: zoomVal)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Карта ТОС'),
          centerTitle: true,
          backgroundColor: Color(0xFf7de1c),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, MyApp.homeRoute);
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(54.195340, 37.620309),
                  zoom: 14,
                  // установить маркер в точку с адресом, внутри target координаты адреса (?)
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set.from(_markers),
                zoomControlsEnabled: false),
            _zoomminusfunction(),
            _zoomplusfunction(),
          ],
        ));
  }
}
