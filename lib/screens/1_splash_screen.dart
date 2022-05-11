import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '2_homescreen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new ProfileScreen(),
      backgroundColor: Color.fromARGB(255, 157, 233, 159),
      title: new Text(
        'Добро пожаловать в приложение ТОС "Парковый"',
        textAlign: TextAlign.center,
        textScaleFactor: 2,
      ),
      image: new Image.asset('assets/images/splashscreen.jpg'),
      loadingText: Text("Загрузка"),
      photoSize: 110.0,
      loaderColor: Color.fromARGB(255, 244, 197, 54),
    );
  }
}
