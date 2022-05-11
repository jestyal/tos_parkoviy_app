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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: bgColorHousesAppBar,
              onPressed: () {
                {
                  Navigator.pushNamed(context, '/catalog', arguments: 'Дома');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/houses.png',
                    width: 60,
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    child: Text(
                      'Дома',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: bgColorEventsAppBar,
              onPressed: () {
                {
                  Navigator.pushNamed(context, '/catalog',
                      arguments: 'Мероприятия');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/events.png',
                    width: 60,
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    child: Text(
                      'Мероприятия',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: bgColorPlacesAppBar,
              onPressed: () {
                {
                  Navigator.pushNamed(context, '/catalog',
                      arguments: 'Пространства');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/locations.png',
                    width: 60,
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    child: Text(
                      'Пространства',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: bgColorOrganizationsAppBar,
              onPressed: () {
                {
                  Navigator.pushNamed(context, '/catalog',
                      arguments: 'Организации');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/organizations.png',
                    width: 60,
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    child: Text(
                      'Организации',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
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
