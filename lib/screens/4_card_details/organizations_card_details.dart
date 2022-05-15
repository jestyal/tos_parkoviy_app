import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';

class OrganizationsCardDetails extends StatefulWidget {
  const OrganizationsCardDetails({Key? key}) : super(key: key);

  @override
  State<OrganizationsCardDetails> createState() =>
      _OrganizationsCardDetailsState();
}

class _OrganizationsCardDetailsState extends State<OrganizationsCardDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DataToMap;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.organizationName),
          centerTitle: true,
          backgroundColor: bgColorOrganizationsAppBar,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/card_map', arguments: DataToMap(
                    bgcolor: args.bgcolor,
                    organizationStreet: args.organizationStreet,
                    organizationHouse: args.organizationHouse,
                    organizationLatitude: args.organizationLatitude,
                    organizationLongitude: args.organizationLongitude,
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
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            args.organizationStreet + " " + args.organizationHouse,
                                            style: const TextStyle(fontSize: 18),
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
                                            'Тип организации',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2, 0, 15),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            args.organizationType,
                                            style: const TextStyle(fontSize: 18),
                                          ))),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(args.organizationImage),
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
                            children: [
                              Flexible(
                                  child: Text(
                                      args.organizationLongDescr,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      overflow: TextOverflow.clip)),
                            ],
                          )),
                      const SizedBox(height: 7),
                    ])))));
  }
}
