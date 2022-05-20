import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog_events.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog_locations.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog_organizations.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/events_card_details.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/houses_card_details.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog_houses.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/locations_card_details.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/organizations_card_details.dart';
import 'package:tos_parkoviy_app/screens/5_map/houses_map.dart';
import 'package:tos_parkoviy_app/screens/5_map/events_map.dart';
import 'package:tos_parkoviy_app/screens/5_map/locations_map.dart';
import 'package:tos_parkoviy_app/screens/5_map/organizations_map.dart';
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
        '/catalog_houses': (context) => CatalogHouses(),
        '/catalog_events': (context) => CatalogEvents(),
        '/catalog_locations': (context) => CatalogLocations(),
        '/catalog_organizations': (context) => CatalogOrganizations(),
        '/house_card_details': (context) => const HousesCardDetails(),
        '/event_card_details': (context) => const EventsCardDetails(),
        '/location_card_details': (context) => const LocationsCardDetails(),
        '/organization_card_details': (context) =>
            const OrganizationsCardDetails(),
        '/house_map': (context) => const HouseMap(),
        '/event_map': (context) => const EventMap(),
        '/organization_map': (context) => const OrganizationMap(),
        '/location_map': (context) => const LocationMap(),
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
