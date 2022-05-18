import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';

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

    final args = ModalRoute.of(context)!.settings.arguments as DataToMap;

    return Scaffold(
        appBar: AppBar(
          title: Text("Ул." + args.streetHouse + ", " + args.numberHouse),
          centerTitle: true,
          backgroundColor: args.bgcolor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/house_map',
                    arguments: DataToMap(
                      bgcolor: args.bgcolor,
                      whatIsThis: "house",
                      streetHouse: args.streetHouse,
                      numberHouse: args.numberHouse,
                      houseLongitude: args.houseLongitude,
                      houseLatitude: args.houseLatitude,
                    ));
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
                      Caretaker(
                        name: args.caretakerName,
                        dadname: args.caretakerDadname,
                        surname: args.caretakerSurname,
                        contact: args.caretakerContact,
                      ),
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
                      Information(
                        year: args.houseYear,
                        serviceProvider: args.serviceProvider,
                      ),
                      const SizedBox(height: 7),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bgColorHouses),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Капитальный ремонт',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 7),
                      Refurbishment(
                        refurbishmentRoofYear: args.refurbishmentRoofYear,
                        refurbishmentRoofCondition:
                            args.refurbishmentRoofCondition,
                        refurbishmentFrontYear: args.refurbishmentFrontYear,
                        refurbishmentFrontCondition:
                            args.refurbishmentFrontCondition,
                        refurbishmentElectronicsYear:
                            args.refurbishmentElectronicsYear,
                        refurbishmentElectronicsCondition:
                            args.refurbishmentElectronicsCondition,
                        refurbishmentWaterYear: args.refurbishmentWaterYear,
                        refurbishmentWaterCondition:
                            args.refurbishmentWaterCondition,
                        refurbishmentSewerageYear:
                            args.refurbishmentSewerageYear,
                        refurbishmentSewerageCondition:
                            args.refurbishmentSewerageCondition,
                        refurbishmentHeatingYear: args.refurbishmentHeatingYear,
                        refurbishmentHeatingCondition:
                            args.refurbishmentHeatingCondition,
                        refurbishmentGasYear: args.refurbishmentGasYear,
                        refurbishmentGasCondition:
                            args.refurbishmentGasCondition,
                      ),
                    ])))));
  }
}

class Caretaker extends StatelessWidget {
  final String? name;
  final String? surname;
  final String? dadname;
  final int? contact;

  const Caretaker({
    Key? key,
    this.name,
    this.surname,
    this.dadname,
    this.contact,
  }) : super(key: key);

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
                    child: Text(
                      // 'caretakerName',
                      name.toString(),
                      style: const TextStyle(fontSize: 18),
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
                    child: Text(
                      // 'caretakerDadname',
                      dadname.toString(),
                      style: const TextStyle(fontSize: 18),
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
                    child: Text(
                      // 'caretakerSurname',
                      surname.toString(),
                      style: const TextStyle(fontSize: 18),
                    )),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 2, 0, 15),
                    child: const Text(
                      'Контакт',
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                    child: Text(
                      contact.toString(),
                      style: const TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ],
        ));
  }
}

class Information extends StatelessWidget {
  final int? year;
  final String? serviceProvider;

  const Information({
    Key? key,
    this.year,
    this.serviceProvider,
  }) : super(key: key);

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
                        child: Text(
                          year.toString(),
                          style: const TextStyle(fontSize: 18),
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
                        child: Text(
                          // 'service_provider',
                          serviceProvider.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
              ],
            ),
          ],
        ));
  }
}

class Refurbishment extends StatelessWidget {
  final int? refurbishmentRoofYear;
  final bool? refurbishmentRoofCondition;
  final int? refurbishmentFrontYear;
  final bool? refurbishmentFrontCondition;
  final int? refurbishmentElectronicsYear;
  final bool? refurbishmentElectronicsCondition;
  final int? refurbishmentWaterYear;
  final bool? refurbishmentWaterCondition;
  final int? refurbishmentSewerageYear;
  final bool? refurbishmentSewerageCondition;
  final int? refurbishmentHeatingYear;
  final bool? refurbishmentHeatingCondition;
  final int? refurbishmentGasYear;
  final bool? refurbishmentGasCondition;

  const Refurbishment({
    Key? key,
    this.refurbishmentRoofYear,
    this.refurbishmentRoofCondition,
    this.refurbishmentFrontYear,
    this.refurbishmentFrontCondition,
    this.refurbishmentElectronicsYear,
    this.refurbishmentElectronicsCondition,
    this.refurbishmentWaterYear,
    this.refurbishmentWaterCondition,
    this.refurbishmentSewerageYear,
    this.refurbishmentSewerageCondition,
    this.refurbishmentHeatingYear,
    this.refurbishmentHeatingCondition,
    this.refurbishmentGasYear,
    this.refurbishmentGasCondition,
  }) : super(key: key);

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
                        child: Text(
                          refurbishmentRoofYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentRoofCondition)
                              ? Icons.done
                              : Icons.close,
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
                        child: Text(
                          refurbishmentFrontYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentFrontCondition)
                              ? Icons.done
                              : Icons.close,
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
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          refurbishmentElectronicsYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentElectronicsCondition)
                              ? Icons.done
                              : Icons.close,
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
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          refurbishmentWaterYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentWaterCondition)
                              ? Icons.done
                              : Icons.close,
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
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          refurbishmentSewerageYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentSewerageCondition)
                              ? Icons.done
                              : Icons.close,
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
                        child: Text(
                          refurbishmentHeatingYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 2),
                        child: Icon(
                          isTrue(refurbishmentHeatingCondition)
                              ? Icons.done
                              : Icons.close,
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
                      style: TextStyle(fontSize: 18),
                    )),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                        child: Text(
                          refurbishmentGasYear.toString(),
                          style: const TextStyle(fontSize: 18),
                        ))),
                Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 15, 15),
                        child: Icon(
                          isTrue(refurbishmentGasCondition)
                              ? Icons.done
                              : Icons.close,
                          size: 30,
                        ))),
              ],
            ),
          ],
        ));
  }
}

bool isTrue(bool? a) {
  if (a == null) {
    return false;
  }
  return a;
}
