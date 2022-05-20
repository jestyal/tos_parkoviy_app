import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';
import 'dart:async';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  Future _addMarker() async {
    String comment = dataToMap.locationName.toString();
    BitmapDescriptor marker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/icons/pin_area.png',
    );
    _markers.add(Marker(
      markerId: const MarkerId('main target'),
      infoWindow: InfoWindow(title: comment),
      position: LatLng(dataToMap.locationLatitude, dataToMap.locationLongitude),
      icon: marker,
    ));

    setState(() {});
  }

  double zoomVal = 14.0;

  Widget _zoomminusfunction() {
    return Align(
      alignment: const Alignment(0.98, 0.1),
      child: Container(
          width: 45,
          child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: dataToMap.bgcolor,
              child: const Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                zoomVal--;
                _minus(zoomVal);
              })),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
        alignment: const Alignment(0.98, -0.1),
        child: Container(
          width: 45,
          child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: dataToMap.bgcolor,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                zoomVal++;
                _plus(zoomVal);
              }),
        ));
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(dataToMap.locationLatitude, dataToMap.locationLongitude),
        zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(dataToMap.locationLatitude, dataToMap.locationLongitude),
        zoom: zoomVal)));
  }

  late DataToMap dataToMap;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    dataToMap = settings.arguments as DataToMap;

    _addMarker();

    return Scaffold(
        appBar: AppBar(
          title: Text(dataToMap.locationName.toString()),
          centerTitle: true,
          backgroundColor: dataToMap.bgcolor,
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
                  target: LatLng(
                      dataToMap.locationLatitude, dataToMap.locationLongitude),
                  zoom: zoomVal,
                ),
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                markers: _markers,
                zoomControlsEnabled: false),
            _zoomminusfunction(),
            _zoomplusfunction(),
          ],
        ));
  }
}
