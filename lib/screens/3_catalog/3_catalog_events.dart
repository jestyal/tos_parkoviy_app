import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/components/constants.dart';
import 'package:tos_parkoviy_app/components/events_fromJson.dart';
// import 'package:tos_parkoviy_app/screens/2_homescreen.dart';
import '../../components/events_fromJson.dart';
import '../4_card_details/class_DataToMap.dart';

class CatalogEvents extends StatelessWidget {
  // late final Data data;

  @override
  Widget build(BuildContext context) {
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // data = settings.arguments as Data;

    return Scaffold(
        appBar: AppBar(
          title: Text('Мероприятия'),
          centerTitle: true,
          backgroundColor: bgColorEventsAppBar,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgroundimage1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: CatalogEventsList()));
  }
}

class CatalogEventsList extends StatefulWidget {
  const CatalogEventsList({
    Key? key,
  }) : super(key: key);

  @override
  _CatalogEventsListState createState() => _CatalogEventsListState();
}

class _CatalogEventsListState extends State<CatalogEventsList> {
  final _searchController = TextEditingController();
  String searchString = "";

  late Future<Events> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getEventsList();
  }

  // late Data data;
  // late final DataToCard colorappbar;

  @override
  Widget build(BuildContext context) {
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // data = settings.arguments as Data;
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding:
                const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 00),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black45,
                    onPressed: () {
                      // widget.parentCallback(cityController.text);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Поиск",
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchString = value.toLowerCase();
                        });
                      },
                    ),
                  ),
                ]),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: futureData,
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var events = data.data as Events;
                var items = events.event as List<Event>;

                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 15, top: 20, right: 15, bottom: 15),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return items[index]
                                .eventName!
                                .toLowerCase()
                                .contains(searchString) ||
                            items[index]
                                .place!
                                .toLowerCase()
                                .contains(searchString) ||
                            items[index]
                                .date!
                                .toLowerCase()
                                .contains(searchString)
                        ? GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: const EdgeInsets.all(2),
                                        margin: const EdgeInsets.only(
                                            right: 18, left: 15),
                                        decoration: const BoxDecoration(
                                          color: bgColorEvents,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              items[index].date.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10,
                                            // left: 20,
                                            top: 15,
                                            bottom: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index].eventName.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "Место проведения: " +
                                                  items[index].place.toString(),
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 22,
                                        height: 22,
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black87,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => {
                                  // colorappbar =
                                  //     DataToCard(bgcolor: this.data.bgcolor),
                              Navigator.pushNamed(
                                  context, '/event_card_details',
                                  arguments: DataToMap(
                                    bgcolor: bgColorEventsAppBar,

                                  )
                              )

                            })
                        : Container();
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

// class DataToCard {
//   final dynamic bgcolor;
//   final dynamic adress;
//   final dynamic json;
//   final dynamic ID;

//   DataToCard({
//     required this.bgcolor,
//     required this.adress,
//     required this.json,
//     required this.ID,
//   });
// }
