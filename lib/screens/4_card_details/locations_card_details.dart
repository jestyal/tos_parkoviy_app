import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';

class LocationsCardDetails extends StatefulWidget {
  const LocationsCardDetails({Key? key}) : super(key: key);

  @override
  State<LocationsCardDetails> createState() => _LocationsCardDetailsState();
}

class _LocationsCardDetailsState extends State<LocationsCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргументы
          title: const Text('Название пространства'),
          centerTitle: true,
          backgroundColor: bgColorPlacesAppBar,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                //TODO: передать аргументы
                DataToMap dataToMap = DataToMap(bgcolor: bgColorHousesAppBar);
                Navigator.pushNamed(context, '/card_map', arguments: dataToMap);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        const AssetImage("assets/images/backgroundimage2.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.colorDodge,
                    ),
                  ),
                ),
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Table(
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 15, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Адрес',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            'street + house',
                                            style: TextStyle(fontSize: 18),
                                          ))),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 2, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Тип пространства',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))),
                                  Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'type',
                                            style: TextStyle(fontSize: 18),
                                          ))),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 2, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Состояние',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))),
                                  Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'condition',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ))),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 2, 0, 15),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Источник финансирования',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))),
                                  Container(
                                      height: 50,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2, 0, 15),
                                      child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'finance',
                                            style: TextStyle(fontSize: 18),
                                          ))),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('assets/images/location.jpeg'),
                      ),
                      const SizedBox(height: 7),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Flexible(
                                  child: Text(
                                      'full_descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      overflow: TextOverflow.clip)),
                            ],
                          )),
                      const SizedBox(height: 7),
                    ])))));
  }
}

// class DataToMap {
//   final dynamic bgcolor;
//   // final dynamic json;
//   // final dynamic ID;

//   DataToMap({
//     required this.bgcolor,
//     // required this.json,
//     // required this.ID,
//   });
// }
