import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';

class HousesCardDetails extends StatefulWidget {
  const HousesCardDetails({Key? key}) : super(key: key);

  @override
  State<HousesCardDetails> createState() => _HousesCardDetailsState();
}

class _HousesCardDetailsState extends State<HousesCardDetails> {
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
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
        body: Container());
  }
}
