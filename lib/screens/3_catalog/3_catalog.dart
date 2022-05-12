import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/screens/2_homescreen.dart';
import '../../components/houses_fromJson.dart';

// class CatalogItem {
//   final String title;
//   final String number; //string потому что может быть номер дома 221б например
//   final String description;
//
//   const CatalogItem({
//     required this.title,
//     required this.number,
//     required this.description,
//   });
// }
//
// const catalogDataList = [
//   CatalogItem(
//     title: 'Название улицы qwe',
//     number: '11',
//     description: 'ФИО старшего по дому',
//   ),
//   CatalogItem(
//     title: 'Название улицы 2',
//     number: '22',
//     description: 'zxc ФИО старшего по дому 2',
//   ),
//   CatalogItem(
//     title: 'Название улицы 33',
//     number: '33',
//     description: 'ФИО старшего по дому 3',
//   ),
// ];

// class CatalogItem {
//   int? id;
//   String? city;
//   String? street;
//   String? house;
//   int? year;
//   String? service_provider;
//
//   // caretaker
//   String? caretakerName;
//   String? caretakerSurname;
//   String? caretakerDadname;
//   String? contact;
//
//   CatalogItem({
//     this.id,
//     this.city,
//     this.street,
//     this.house,
//     this.year,
//     this.service_provider,
//     this.caretakerName,
//     this.caretakerSurname,
//     this.caretakerDadname,
//     this.contact,
//   });
//
//   CatalogItem.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     city = json['city'];
//     street = json['street'];
//   }
// }

class Catalog extends StatelessWidget {
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
            child: CatalogList()));
  }
}

class CatalogList extends StatefulWidget {
  const CatalogList({
    Key? key,
  }) : super(key: key);

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  // getColorAppBar(String title) {
  //   if (title == "Дома") {
  //     return bgColorHousesAppBar;
  //   } else if (title == "Организации") {
  //     return bgColorOrganizationsAppBar;
  //   } else if (title == "Пространства") {
  //     return bgColorPlacesAppBar;
  //   } else if (title == "Мероприятия") {
  //     return bgColorEventsAppBar;
  //   } else {
  //     return bgColorHousesAppBar;
  //   }
  // }

  final _searchController = TextEditingController();

  // List<CatalogItem> items = catalogDataList;

  late Future<Houses> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getHousesList() as Future<Houses>;
  }

  // Future<List<CatalogItem>> readJsonData() async {
  //   final jsonData = await rootBundle.loadString('assets/json/houses.json');
  //   final list = json.decode(jsonData) as List<dynamic>;
  //
  //   return list.map((e) => CatalogItem.fromJson(e)).toList();
  // }
  // void searchInCatalog(String query) {
  //   if (query.isNotEmpty) {
  //     final suggestions = items.where((item) {
  //       final itemTitle = item.title.toLowerCase();
  //       final itemDesc = item.description.toLowerCase();
  //
  //       final input = query.toLowerCase();
  //
  //       return itemTitle.contains(input) || itemDesc.contains(input);
  //     }).toList();
  //     setState(() {
  //       items = suggestions;
  //     });
  //   } else {
  //     _searchController.clear();
  //     setState(() {
  //       items = catalogDataList;
  //     });
  //   }
  // }

  late final Data data;
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
                      // onChanged: searchInCatalog,
                    ),
                  ),
                ]),
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     padding:
        //         const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 15),
        //     itemCount: 5,
        //     // itemCount: items.length,
        //     itemBuilder: (_, index) {
        //       final item = items[index];
        //
        //       return GestureDetector(
        //           child: Container(
        //             margin: const EdgeInsets.only(bottom: 15),
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: const BorderRadius.all(Radius.circular(10)),
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.black.withOpacity(0.1),
        //                   spreadRadius: 3,
        //                   blurRadius: 5,
        //                   offset: const Offset(0, 3),
        //                 ),
        //               ],
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Container(
        //                       width: 50,
        //                       height: 50,
        //                       padding: const EdgeInsets.all(2),
        //                       margin:
        //                           const EdgeInsets.only(right: 18, left: 15),
        //                       decoration: const BoxDecoration(
        //                         color: bgColorHouses,
        //                         borderRadius:
        //                             BorderRadius.all(Radius.circular(10)),
        //                       ),
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         crossAxisAlignment: CrossAxisAlignment.center,
        //                         children: [
        //                           Text(
        //                             "number",
        //                             // item.number,
        //                             textAlign: TextAlign.center,
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(
        //                           right: 10,
        //                           // left: 20,
        //                           top: 15,
        //                           bottom: 15),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             "title",
        //                             // item.title,
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                             ),
        //                           ),
        //                           Text(
        //                             "description",
        //                             // item.description,
        //                             style: const TextStyle(fontSize: 14),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Column(
        //                   children: [
        //                     Container(
        //                       width: 22,
        //                       height: 22,
        //                       margin: const EdgeInsets.only(right: 20),
        //                       child: const Align(
        //                         alignment: Alignment.center,
        //                         child: Icon(
        //                           Icons.arrow_forward_ios,
        //                           color: Colors.black87,
        //                           size: 20,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //           onTap: () =>
        //               {Navigator.pushNamed(context, '/house_card_details')});
        //     },
        //   ),
        // ),
        Expanded(
          child: FutureBuilder(
            // future: readJsonData(),
            future: futureData,
            // builder: (context, snapshot) {
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items1 = data.data as Houses;
                var items = items1.house as List<House>;
                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 15, top: 20, right: 15, bottom: 15),
                  itemCount: items == null ? 0 : items.length,
                  // itemCount: 1,
                  itemBuilder: (_, index) {
                    return GestureDetector(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          // item.number,
                                          items[index].city.toString(),
                                          // snapshot.data[index].city,
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
                                          // item.title,
                                          items[index].city.toString(),
                                          // "222",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          // item.description,
                                          // items[index].city.toString(),
                                          "333",
                                          style: const TextStyle(fontSize: 14),
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
                                    margin: const EdgeInsets.only(right: 20),
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
                              colorappbar =
                                  DataToCard(bgcolor: this.data.bgcolor),
                              Navigator.pushNamed(
                                  context, '/house_card_details',
                                  arguments: colorappbar)
                            });
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
