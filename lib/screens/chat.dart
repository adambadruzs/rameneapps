import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
