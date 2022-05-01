import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/screens/4_card_details.dart';
import 'package:tos_parkoviy_app/screens/3_catalog.dart';
import 'package:tos_parkoviy_app/screens/5_display_map.dart';
import 'package:tos_parkoviy_app/screens/2_homescreen.dart';
import 'components/constants.dart';
import 'screens/1_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String homeRoute = '/home';
  static const String catalogRoute = '/catalog';
  static const String cardDetailsRoute = '/card_details';
  static const String cardMapRoute = '/card_map';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TOS Parkoviy',
      theme: ThemeData(
        fontFamily: "Nunito",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const SplashScreenPage(),
      onGenerateRoute: (settings) {
        if (settings.name == homeRoute) {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        } else if (settings.name == catalogRoute) {
          var title = settings.arguments;
          return MaterialPageRoute(
              builder: (context) => CatalogList(title: '$title'));
        } else if (settings.name == cardDetailsRoute) {
          return MaterialPageRoute(builder: (context) => const CardDetails());
        } else if (settings.name == cardMapRoute) {
          return MaterialPageRoute(builder: (context) => const DisplayMap());
        }
        return null;
      },
    );
  }
}
