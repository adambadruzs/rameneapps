import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rameneapps/constants.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
