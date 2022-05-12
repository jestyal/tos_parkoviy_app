import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/screens/2_homescreen.dart';
import '../../components/houses_fromJson.dart';

class CatalogEvents extends StatelessWidget {
  late final Data data;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    data = settings.arguments as Data;

    return Scaffold(
        appBar: AppBar(
          title: Text('${this.data.title}'),
          centerTitle: true,
          backgroundColor: this.data.bgcolor,
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

  late Future<Houses> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getHousesList();
  }

  late Data data;
  late final DataToCard colorappbar;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    data = settings.arguments as Data;
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
                var houses = data.data as Houses;
                var items = houses.house as List<House>;

                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 15, top: 20, right: 15, bottom: 15),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return items[index]
                                .street!
                                .toLowerCase()
                                .contains(searchString) ||
                            items[index]
                                .caretaker![0]
                                .caretakerDadname!
                                .toLowerCase()
                                .contains(searchString) ||
                            items[index]
                                .caretaker![0]
                                .caretakerName!
                                .toLowerCase()
                                .contains(searchString) ||
                            items[index]
                                .caretaker![0]
                                .caretakerSurname!
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
                                        decoration: BoxDecoration(
                                          color: this.data.colorSquare,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              items[index].house.toString(),
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
                                              items[index].street.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              items[index]
                                                      .caretaker![0]
                                                      .caretakerSurname
                                                      .toString() +
                                                  " " +
                                                  items[index]
                                                      .caretaker![0]
                                                      .caretakerName
                                                      .toString() +
                                                  " " +
                                                  items[index]
                                                      .caretaker![0]
                                                      .caretakerDadname
                                                      .toString(),
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
                                    // arguments: colorappbar
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

class DataToCard {
  final dynamic bgcolor;
  // final dynamic adress;
  // final dynamic json;
  // final dynamic ID;

  DataToCard({
    required this.bgcolor,
    // required this.adress,
    // required this.json,
    // required this.ID,
  });
}
