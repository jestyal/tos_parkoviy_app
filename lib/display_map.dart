import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';

class DisplayMap extends StatelessWidget {
  const DisplayMap({Key? key}) : super(key: key);

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
        ));
  }
}
