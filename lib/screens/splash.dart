import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rameneapps/screens/landing.dart';

class SplashScreen extends StatefulWidget {
  Function setTheme;
  SplashScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
    });
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Landing(setTheme: setTheme)));
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              Image.asset(
                "assets/images/Group5.png",
                fit: BoxFit.cover,
              ),
              const Padding(padding: EdgeInsets.only(top: 15, bottom: 5)),
              Image.asset(
                "assets/images/Group12.png",
                fit: BoxFit.cover,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'All your\nfavourite ramen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Delicious as is or tossed with your\nfavorite ingredients',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ]),
      ),
    );
  }
}
