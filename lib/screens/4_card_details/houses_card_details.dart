import 'package:flutter/material.dart';
import '../../components/houses_fromJson.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog.dart';

class HousesCardDetails extends StatefulWidget {
  const HousesCardDetails({Key? key}) : super(key: key);

  @override
  State<HousesCardDetails> createState() => _HousesCardDetailsState();
}

class _HousesCardDetailsState extends State<HousesCardDetails> {
  late final DataToCard colorappbar;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    colorappbar = settings.arguments as DataToCard;

    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргументы
          title: Text('Адрес'),
          centerTitle: true,
          backgroundColor: colorappbar.bgcolor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                //TODO: передать аргументы
                Navigator.pushNamed(context, '/card_map');
              },
            ),
          ],
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Старший',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Table(
                // border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            'Имя',
                            style: TextStyle(fontSize: 18),
                          )),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            'Имя',
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                ],
              ),
            ])));
  }
}
