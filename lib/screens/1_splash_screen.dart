import 'dart:async';
import 'package:flutter/material.dart';
import '2_homescreen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/splashscreen.jpg',
              height: 530, width: 530),
          Text(" "),
          Text(
            'ТОС «Парковый»',
            style: TextStyle(
                fontSize: 35,
                color: Colors.green,
                fontStyle: FontStyle.italic,
                fontFamily: 'Aerovista'),
            textAlign: TextAlign.end,
          ),
          Text(" "),
          Text(
            'Вместе сможем больше!',
            style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                fontFamily: 'Aerovista'),
            textAlign: TextAlign.end,
          )
        ],
      ),
    ));
  }
}
