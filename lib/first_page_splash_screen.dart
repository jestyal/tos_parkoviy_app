import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'homescreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomeScreen(),
      backgroundColor: Color.fromARGB(255, 157, 233, 159),
      title: new Text(
        'Добро пожаловать в приложение ТОС "Парковый"',
        textScaleFactor: 2,
      ),
      image: new Image.network('https://images.app.goo.gl/gj2DscmNumpFqZEg9'),
      loadingText: Text("Загрузка"),
      photoSize: 110.0,
      loaderColor: Color.fromARGB(255, 244, 197, 54),
    );
  }
}
