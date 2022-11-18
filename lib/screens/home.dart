import 'package:flutter/material.dart';
import 'package:rameneapps/constants.dart';
import 'package:rameneapps/data/ramene.dart';
import 'package:rameneapps/screens/chat.dart';
import 'package:rameneapps/screens/order.dart';
import 'package:rameneapps/screens/profile.dart';
import 'package:rameneapps/shared_pref.dart';

import '../nav-drawer.dart';

class Home extends StatefulWidget {
  Function setTheme;

  Home({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Home> createState() => _Hometate();
}

class _Hometate extends State<Home> {
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List pages = [
    ContainerHome(),
    Chat(),
    Order(),
    Profile(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'HOME',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.dark_mode,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              isDarkmode = !isDarkmode;
              widget.setTheme(isDarkmode);
            },
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: pages.elementAt(currentIndex),
    );
  }
}

class ContainerHome extends StatelessWidget {
  ContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            controller: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search ramen...',
              hintStyle: TextStyle(
                fontFamily: 'Poppins Light',
                color: lightGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: lightGrey),
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Menu",
              style: TextStyle(
                fontFamily: "Poppins Bold",
                fontSize: 17,
                color: darkGrey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: ramens.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(ramen: ramens[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Ramen ramen;
  const ItemCard({
    Key? key,
    required this.ramen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            // height: 170,
            // width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(ramen.image),
                )),
          ),
        ),
        SizedBox(height: 10),
        Text(
          ramen.name,
          style: TextStyle(
            color: darkGrey,
            fontFamily: 'Poppins Light',
          ),
        ),
        SizedBox(height: 2),
        Text(
          ramen.price.toString(),
          style: TextStyle(
            color: lightGrey,
            fontFamily: 'Poppins Bold',
          ),
        ),
      ],
    );
  }
}
