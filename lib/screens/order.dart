import 'package:flutter/material.dart';
import 'package:rameneapps/constants.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "ORDER",
          style: TextStyle(
            fontFamily: "Poppins Bold",
            color: darkGrey,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
