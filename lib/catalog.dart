import 'package:flutter/material.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {

  // TODO: будет загрузка данных
  List listOfPlaces = [
    'Дом 1',
    'Дом 2',
    'Дом 3'
  ];
  List listOfPlacesDescription = [
    'Какая-то инфа 11111111',
    'Какая-то инфа 222222222',
    'Какая-то инфа 333333333'
  ];
  List listOfPlacesImages = [
    'assets/images/place1.jpg',
    'assets/images/place2.jpg',
    'assets/images/place3.jpg',
  ];

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
          //  TODO: сделать событие нажатия на кнопу назад
        ),
        title: Text(widget.title),
        //  TODO: должно передавться название раздела
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home, size: 30),
            onPressed: () {
              // TODO: сделать событие нажатия на кнопку домой
            },
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (_, index) => const Divider(color: Colors.grey),
        // TODO: сделать длину позиций
        itemCount: listOfPlaces.length,
        // itemCount: 5,
        itemBuilder: (_, index) {
          return GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: AssetImage(listOfPlacesImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // TODO: сделать переход по нажатию
              // onTap: () => {
              //       onSelectedPlaces!(listOfPlaces[index]),
              //       onSelectedPlacesDescription!(
              //           listOfPlacesDescription[index]),
              //       onSelectedPlacesImages!(listOfPlacesImages[index]),
              //     }
          );
        },
      ),
    );
  }
}
