import 'package:flutter/material.dart';
import '2_homescreen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({ Key? key }) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.push (
      context, MaterialPageRoute(
        builder: (context)=> ProfieleScreen())),);
  }
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashscreen.jpeg', height: 530, width: 450),
            Text(" "),
            Text('ТОС «Парковый»', style: TextStyle(fontSize: 25, color: Colors.green, fontStyle: FontStyle.italic), textAlign: TextAlign.end,),
            Text(" "),
            Text('Вместе сможем больше!', style: TextStyle(fontSize: 22, color: Colors.blue, fontStyle: FontStyle.italic),textAlign: TextAlign.end,)
          ],
        ),
      )
      
    );
  }
}
