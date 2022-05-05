import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/main.dart';
import 'package:tos_parkoviy_app/components/constants.dart';

class CatalogItem {
  final String title;
  final String number; //string потому что может быть номер дома 221б например
  final String description;

  const CatalogItem({
    required this.title,
    required this.number,
    required this.description,
  });
}

const catalogDataList = [
  CatalogItem(
    title: 'Название улицы qwe',
    number: '11',
    description: 'ФИО старшего по дому',
  ),
  CatalogItem(
    title: 'Название улицы 2',
    number: '22',
    description: 'ФИО старшего по дому 2',
  ),
  CatalogItem(
    title: 'Название улицы 33',
    number: '33',
    description: 'ФИО старшего по дому 3',
  ),
];

class CatalogList extends StatefulWidget {
  final String title;

  // final Function(String) parentCallback;

  const CatalogList({
    Key? key,
    required this.title,
    // required this.parentCallback,
  }) : super(key: key);

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  getColorAppBar(String title) {
    if (title == "Дома") {
      return bgColorHousesAppBar;
    } else if (title == "Организации") {
      return bgColorOrganizationsAppBar;
    } else if (title == "Пространства") {
      return bgColorPlacesAppBar;
    } else if (title == "Мероприятия") {
      return bgColorEventsAppBar;
    } else {
      return bgColorHousesAppBar;
    }
  }

  final _searchController = TextEditingController();
  List<CatalogItem> items = catalogDataList;

  @override
  void initState() {
    super.initState();
  }

  void searchInCatalog(String query) {
    if (query.isNotEmpty) {
      final suggestions = items.where((item) {
        final itemTitle = item.title.toLowerCase();
        // final itemDesc = item.description.toLowerCase();
        final input = query.toLowerCase();

        return itemTitle.contains(input);
      }).toList();
      setState(() {
        items = suggestions;
      });
    } else {
      FocusScope.of(context).unfocus();
      _searchController.clear();

      setState(() {
        items = catalogDataList;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: getColorAppBar(widget.title),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgroundimage1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 00),
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
                  child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        onChanged: searchInCatalog,
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 15),
                  // itemCount: listOfPlaces.length,
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final item = items[index];

                    return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                    margin: const EdgeInsets.only(right: 18, left: 15),
                                    decoration: const BoxDecoration(
                                      color: bgColorHouses,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.number,
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          item.description,
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
                              Navigator.pushNamed(
                                context,
                                MyApp.cardDetailsRoute,
                                //    ItemPage(item: item),
                              )
                            });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
