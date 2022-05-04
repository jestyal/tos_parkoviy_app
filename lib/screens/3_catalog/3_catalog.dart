import 'package:flutter/material.dart';
import 'package:tos_parkoviy_app/main.dart';

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
  // TODO: будет загрузка данных
  List listOfPlaces = ['Номер дома', 'Дом 2', 'Дом 3'];
  List listOfPlacesDescription = [
    'Год постройки и тип постройки',
    'Какая-то инфа 222222222',
    'Какая-то инфа 333333333'
  ];
  List listOfPlacesImages = [
    'assets/images/place1.jpg',
    'assets/images/place2.jpg',
    'assets/images/place3.jpg',
  ];

  static const bgColorHouses = Color(0xFFa6c515);
  static const bgColorEvents = Color(0xFFf28824);
  static const bgColorOrganizations = Color(0xFFd61315);
  static const bgColorPlaces = Color(0xFF174aad);

  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: bgColorHouses,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.home, size: 30),
        //     onPressed: () {
        //       Navigator.pushNamed(context, MyApp.homeRoute);
        //     },
        //   ),
        // ],
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
                  padding: const EdgeInsets.only(
                      left: 5, top: 5, right: 5, bottom: 00),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
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
                            controller: cityController,
                            decoration: const InputDecoration.collapsed(
                                hintText: "Поиск"),
                            // onSubmitted: (String city) =>
                            //     {widget.parentCallback(city)}
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 15),
                  // separatorBuilder: (_, index) => const Divider(),
                  // TODO: сделать длину позиций
                  itemCount: listOfPlaces.length,
                  // itemCount: 5,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
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
                              Padding(
                                padding: const EdgeInsets.only(right: 10, left: 20, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        listOfPlaces[index],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      listOfPlacesDescription[index],
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
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
                          // TODO: передать аргументы
                          Navigator.pushNamed(
                              context, MyApp.cardDetailsRoute)
                          // onSelectedPlaces!(listOfPlaces[index]),
                          // onSelectedPlacesDescription!(
                          //     listOfPlacesDescription[index]),
                          // onSelectedPlacesImages!(listOfPlacesImages[index]),
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
