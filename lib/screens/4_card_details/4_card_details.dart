import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../main.dart';
import 'dart:async';
import 'dart:convert';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргументы
          title: Text('Название карточки'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, MyApp.homeRoute);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Старший',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                'Имя',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Фамилия',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Отчество',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Контакт',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Информация о доме',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                'Год постройки:',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'УК',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Адрес:',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Капитальный ремонт',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  Text('Вид работ:'),
                  Text('Год проведения:'),
                  Text('Состояние:'),
                ],
              ),
              Row(
                children: [
                  Text('Крыша'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Фасад'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Электрика'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Вода'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Канализация'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Отопление'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
              Row(
                children: [
                  Text('Газ'),
                  Text('2022'),
                  Icon(Icons.done),
                ],
              ),
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
          ),
        ));
  }
}
