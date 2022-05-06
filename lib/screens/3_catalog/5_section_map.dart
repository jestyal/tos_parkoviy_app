import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
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
  Set<Marker> _markersHouses = {};
  Set<Marker> _markersEvents = {};
  Set<Marker> _markersPlases = {};
  Set<Marker> _markersOrganizations = {};

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
      _markers.add(Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen)));
    });
  }

  double zoomVal = 14.0;

  Widget _zoomminusfunction() {
    return Container(
        width: 45,
        child: FloatingActionButton(
            backgroundColor: bgColorMapAppBar,
            child: Icon(Icons.remove, color: Colors.white),
            onPressed: () {
              zoomVal--;
              _minus(zoomVal);
            }));
  }

  Widget _zoomplusfunction() {
    return Container(
      width: 45,
      child: FloatingActionButton(
          backgroundColor: bgColorMapAppBar,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Карта ТОС'),
          centerTitle: true,
          backgroundColor: bgColorMapAppBar,
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
        body: Column(children: [
          Stack(
            children: [
              Container(
                  height: 480,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(54.186415, 37.599950),
                        zoom: zoomVal,
                        // установить маркер в точку с адресом, внутри target координаты адреса (?)
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      markers: Set.from(_markers),
                      zoomControlsEnabled: false)),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 170, right: 5),
                child: Column(
                  children: [_zoomminusfunction(), _zoomplusfunction()],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButton(
                title: 'Дома',
              ),
              ToggleButton(
                title: 'Мероприятия',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButton(
                title: 'Пространства',
              ),
              ToggleButton(
                title: 'Организации',
              ),
            ],
          )
        ]));
  }
}

class ToggleButton extends StatefulWidget {
  final String title;

  const ToggleButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final List<bool> isSelected = [false];

  getbgColor(String title) {
    if (title == "Дома") {
      return bgColorHousesAppBar;
    } else if (title == "Организации") {
      return bgColorOrganizationsAppBar;
    } else if (title == "Пространства") {
      return bgColorPlacesAppBar;
    } else if (title == "Мероприятия") {
      return bgColorEventsAppBar;
    } else {
      return bgColorHousesAppBar;
    }
  }

  getBorderColor(String title) {
    if (title == "Дома") {
      return bgColorHousesAppBar;
    } else if (title == "Организации") {
      return bgColorOrganizationsAppBar;
    } else if (title == "Пространства") {
      return bgColorPlacesAppBar;
    } else if (title == "Мероприятия") {
      return bgColorEventsAppBar;
    } else {
      return bgColorHousesAppBar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      isSelected: isSelected,
      fillColor: getBorderColor(widget.title),
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          color: getbgColor(widget.title),
          width: 180,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
              child: Text(widget.title,
                  style: TextStyle(fontSize: 18, color: Colors.white))),
        )
      ],
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
    );
  }
}
