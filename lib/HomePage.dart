// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
          textTheme: const TextTheme(
            caption: TextStyle(fontSize: 20, color: Colors.white),
          ),
          fontFamily: 'Lato-Black'),
      home: const ProfileScreen(),
    );
  }
}

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
                Colors.white.withOpacity(0.5),
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
                  fontSize: 30,
                  color: Color(hexColor('#00008B')),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: Colors.green[700],
              onPressed: () {},
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
                      'Дом',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: Colors.orange,
              onPressed: () {},
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: Colors.blue[900],
              onPressed: () {},
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: Colors.red[900],
              onPressed: () {},
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150)),
              color: Colors.yellow,
              onPressed: () {},
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
