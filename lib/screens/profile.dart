import 'package:flutter/material.dart';
import 'package:rameneapps/constants.dart';
import 'package:rameneapps/screens/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const SizedBox(
              height: 125,
              width: 125,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/yuu2.png"),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Adam Badruzzaman",
              style: TextStyle(
                fontFamily: "Poppins Bold",
                fontSize: 22,
                color: darkGrey,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              "087884273699",
              style: TextStyle(
                fontFamily: "Poppins Light",
                fontSize: 18,
                color: lightGrey,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: extraLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Change password",
                    style: TextStyle(
                      fontFamily: "Poppins Light",
                      color: lightGrey,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: lightGrey, size: 24),
                ],
              ),
            ),
            const SizedBox(height: 13),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: extraLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Setting",
                    style: TextStyle(
                      fontFamily: "Poppins Light",
                      color: lightGrey,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: lightGrey, size: 24),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: orangeAccent,
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                },
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
