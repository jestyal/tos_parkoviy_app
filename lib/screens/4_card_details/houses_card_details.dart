import 'package:flutter/material.dart';
import '../../components/houses_fromJson.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/3_catalog.dart';
import 'package:tos_parkoviy_app/components/constants.dart';

class HousesCardDetails extends StatefulWidget {
  const HousesCardDetails({Key? key}) : super(key: key);

  @override
  State<HousesCardDetails> createState() => _HousesCardDetailsState();
}

class _HousesCardDetailsState extends State<HousesCardDetails> {
  // late final DataToCard colorappbar;

  // @override
  // void initState() {}

  @override
  Widget build(BuildContext context) {
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // colorappbar = settings.arguments as DataToCard;

    return Scaffold(
        appBar: AppBar(
          //TODO: передать аргументы
          title: const Text('Адрес'),
          centerTitle: true,
          backgroundColor: bgColorHousesAppBar,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
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
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bgColorHouses),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Старший',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 7),
                      Caretaker(),
                      const SizedBox(height: 7),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bgColorHouses),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Информация о доме',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 7),
                      Information(),
                      const SizedBox(height: 7),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bgColorHouses),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Капитальный ремонт',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 7),
                      Refurbishment(),
                    ])))));
  }
}

class Caretaker extends StatelessWidget {
  const Caretaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Table(
          columnWidths: const {0: FlexColumnWidth(0.5)},
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 0, 2),
                    child: const Text(
                      'Имя',
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 2),
                    child: const Text(
                      'caretakerName',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Отчество',
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: const Text(
                      'caretakerDadname',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Фамилия',
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: const Text(
                      'caretakerSurname',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 15),
                    child: const Text(
                      'Контакт',
                      style: const TextStyle(fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                    child: const Text(
                      'contact',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ],
        ));
  }
}

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Table(
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 2),
                        child: const Text(
                          'Год постройки',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 2),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                        child: const Text(
                          'УК',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                        child: const Text(
                          'service_provider',
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            ),
          ],
        ));
  }
}

class Refurbishment extends StatelessWidget {
  const Refurbishment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(0.45),
            1: FlexColumnWidth(0.4),
            2: FlexColumnWidth(0.4),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 7, 0, 7),
                    child: const Text(
                      'Вид работ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child: const Text(
                          'Год',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 15, 7),
                        child: const Text(
                          'Статус',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Крыша',
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.done,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Фасад',
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.done,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Электрика',
                      style: const TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.done,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Вода',
                      style: const TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.done,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Канализация',
                      style: const TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: const Text(
                      'Отопление',
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: const Text(
                          'year',
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ))),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 15),
                    child: const Text(
                      'Газ',
                      style: const TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                        child: const Text(
                          'year',
                          style: TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 15),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ))),
              ],
            ),
          ],
        ));
  }
}
