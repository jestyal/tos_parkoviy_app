import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
import 'package:tos_parkoviy_app/screens/4_card_details/class_DataToMap.dart';

class EventsCardDetails extends StatefulWidget {
  const EventsCardDetails({Key? key}) : super(key: key);

  @override
  State<EventsCardDetails> createState() => _EventsCardDetailsState();
}

class _EventsCardDetailsState extends State<EventsCardDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DataToMap;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.eventName),
          centerTitle: true,
          backgroundColor: bgColorEventsAppBar,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.map,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/card_map', arguments: DataToMap(bgcolor: args.bgcolor));
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
                                      child: const Text(
                                        'Место проведения',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 2),
                                      child: Text(
                                        args.eventPlace,
                                        style: const TextStyle(fontSize: 18),
                                      )),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 2, 0, 2),
                                      child: const Text(
                                        'Дата и время',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: Text(
                                        args.eventDate + " " + args.eventTime,
                                        style: const TextStyle(fontSize: 18),
                                      )),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 2, 0, 15),
                                      child: const Text(
                                        'Тип мероприятия',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2, 0, 15),
                                      child: Text(
                                        // args.eventType,
                                        "args.eventType",
                                        style: const TextStyle(fontSize: 18),
                                      )),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(args.eventImg),
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
                                      args.eventDesc,
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
