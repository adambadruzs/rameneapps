import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rameneapps/constants.dart';
import 'package:rameneapps/screens/login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 40),
            SizedBox(
              height: 125,
              width: 125,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/yuu2.png"),
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Adam Badruzzaman",
              style: TextStyle(
                fontFamily: "Poppins Bold",
                fontSize: 22,
                color: darkGrey,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "087884273699",
              style: TextStyle(
                fontFamily: "Poppins Light",
                fontSize: 18,
                color: lightGrey,
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              decoration: BoxDecoration(
                color: extraLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 13),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              decoration: BoxDecoration(
                color: extraLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: orangeAccent,
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
                child: Text(
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
