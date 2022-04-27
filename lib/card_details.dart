import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргументы
          title: Text('Название карточки'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home,size: 30,),
              onPressed: () {
                Navigator.pushNamed(context, MyApp.homeRoute);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Заголовок',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'Информация',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'Адрес: Адрес',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Расположение:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
                height: 200,
                padding: EdgeInsets.all(10.0),
                child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                  target: LatLng(54.195340, 37.620309),
                  zoom: 14,
                  // установить маркер в точку с адресом, внутри target координаты адреса (?)
                ))),
            ElevatedButton(
              // style: ButtonStyle(),
              onPressed: () {
                //TODO: передать аргументы
                Navigator.pushNamed(context, MyApp.cardMapRoute);
                // при нажатии на кнопку переход на следующий экран
              },
              child: const Text('Развернуть карту'),
            ),
          ]),
        ));
  }
}
