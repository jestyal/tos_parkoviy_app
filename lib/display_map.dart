import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'main.dart';
import 'dart:async';
import 'dart:convert';

class DisplayMap extends StatefulWidget {
  const DisplayMap({Key? key}) : super(key: key);

  @override
  State<DisplayMap> createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      loadMarkers();
    });
  }

  Future loadMarkers() async {
    var jsonData = await rootBundle.loadString('assets/data.json');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргумент
          title: Text('Название карточки'),
          centerTitle: true,
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
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(54.195340, 37.620309),
            zoom: 14,
            // установить маркер в точку с адресом, внутри target координаты адреса (?)
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set.from(_markers),
        ));
  }
}
