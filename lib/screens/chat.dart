import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "CHAT",
          style: TextStyle(
            fontFamily: "Poppins Bold",
            color: Colors.grey,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
