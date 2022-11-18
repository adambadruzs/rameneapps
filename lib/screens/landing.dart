import 'package:flutter/material.dart';
import 'package:rameneapps/screens/login.dart';
import 'package:rameneapps/screens/register.dart';
import 'package:rameneapps/shared_pref.dart';

class Landing extends StatefulWidget {
  Function setTheme;
  Landing({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 25)),
              Image.asset(
                'assets/images/Group5.png',
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(top: 15, bottom: 5)),
              Image.asset(
                'assets/images/Group12.png',
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'All your\nfavourite ramen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Delicious as is or tossed with your\nfavorite ingredients',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text("Login",
                    style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        fontSize: 16,
                        color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    minimumSize: const Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: const Text("Sign Up",
                    style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        fontSize: 16,
                        color: Color.fromARGB(255, 252, 252, 252))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 227, 173, 27),
                    minimumSize: const Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ]),
      ),
    );
  }
}
