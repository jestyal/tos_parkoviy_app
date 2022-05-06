import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:tos_parkoviy_app/screens/3_catalog/5_section_map.dart';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Список',
//       theme: ThemeData(
//         fontFamily: "Nunito",
//         scaffoldBackgroundColor: kBackgroundColor,
//         textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //give us total height and with our phone
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 144, 76),
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            )
          ]),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 184, 245, 185),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Tos Parkoviy",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Дома",
                          images: "assets/images/4.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Мероприятия",
                          images: "assets/images/1.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Пространства",
                          images: "assets/images/3.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Организации",
                          images: "assets/images/2.png",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text("Карта локаций"),
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: ((context) => TOSMap()));
                        Navigator.push(context, route);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String images;
  final Function press;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.images,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        //padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () =>
                {Navigator.pushNamed(context, '/catalog', arguments: title)},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  const Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
