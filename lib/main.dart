import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/houses_card_details.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog.dart';
import 'package:tos_parkoviy_app/screens/5_display_map.dart';
import 'package:tos_parkoviy_app/screens/2_homescreen.dart';
import 'screens/1_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const ProfileScreen(),
        '/catalog': (context) => Catalog(),
        '/house_card_details': (context) => const HousesCardDetails(),
        '/card_map': (context) => const DisplayMap(),
      },
      debugShowCheckedModeBanner: false,
      title: 'ТОС Парковый',
      theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
          textTheme: const TextTheme(
            caption: TextStyle(fontSize: 20, color: Colors.white),
          ),
          fontFamily: 'Lato'),
      home: const SplashScreenPage(),
    );
  }
}
