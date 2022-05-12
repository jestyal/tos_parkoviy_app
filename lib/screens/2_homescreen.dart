import 'package:flutter/material.dart';
import '../../components/constants.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/5_section_map.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/backgroundimage.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7),
                BlendMode.colorDodge,
              )),
        ),
        child: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Выберите раздел',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(hexColor('#00365B')),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          MenuCard(
            icon: 'assets/icons/houses.png',
            bgcolor: bgColorHousesAppBar,
            title: 'Дома',
            colorSquare: bgColorHouses,
            json: 'assets/json/houses.json',
            pathName: '/catalog_houses',
          ),
          MenuCard(
            icon: 'assets/icons/events.png',
            bgcolor: bgColorEventsAppBar,
            title: 'Мероприятия',
            colorSquare: bgColorEvents,
            json: 'assets/json/events.json',
            pathName: '/catalog_events',
          ),
          MenuCard(
            icon: 'assets/icons/locations.png',
            bgcolor: bgColorPlacesAppBar,
            title: 'Пространства',
            colorSquare: bgColorPlaces,
            json: 'assets/json/locations.json',
            pathName: '/catalog_locations',
          ),
          MenuCard(
            icon: 'assets/icons/organizations.png',
            bgcolor: bgColorOrganizationsAppBar,
            title: 'Организации',
            colorSquare: bgColorOrganizations,
            json: 'assets/json/organizations.json',
            pathName: '/catalog_organizations',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: bgColorMapAppBar,
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: ((context) => const TOSMap()));
                Navigator.push(context, route);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/map.png',
                    width: 60,
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    child: Text(
                      'Карта локаций',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}

class MenuCard extends StatelessWidget {
  late String icon;
  late String title;
  late String json;
  late String pathName;
  dynamic bgcolor;
  dynamic colorSquare;

  MenuCard(
      {required this.icon,
      required this.bgcolor,
      required this.title,
        required this.pathName,
      required this.colorSquare,
      required this.json});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: RaisedButton(
        color: bgcolor,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
        onPressed: () {
          {
            Data data = Data(
                title: this.title,
                bgcolor: this.bgcolor,
                colorSquare: colorSquare,
                json: json);
            Navigator.pushNamed(context, this.pathName, arguments: data);
          }
        },
        child: Row(
          children: [
            Image.asset(
              '$icon',
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 25),
            Text(
              '$title',
              style: TextStyle(fontSize: 23, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  final dynamic title;
  final dynamic bgcolor;
  final dynamic json;
  final dynamic colorSquare;

  Data(
      {required this.title,
      required this.bgcolor,
      required this.json,
      required this.colorSquare});
}
