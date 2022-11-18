import 'package:flutter/material.dart';
import 'package:rameneapps/constants.dart';
import 'package:rameneapps/data/ramene.dart';
import 'package:rameneapps/screens/chat.dart';
import 'package:rameneapps/screens/order.dart';
import 'package:rameneapps/screens/profile.dart';
import 'package:rameneapps/services/ramene_service.dart';
import 'package:rameneapps/shared_pref.dart';
import 'package:rameneapps/model/ramene_model.dart';
import 'package:rameneapps/services/ramene_service.dart';
import '../nav-drawer.dart';

class HomePage extends StatefulWidget {
//   Function setTheme;
//  HomePage({Key? key, required this.setTheme}) : super(key: key);
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.dark_mode,
          //       color: Color.fromARGB(255, 0, 0, 0)),
          //   onPressed: () {
          //     isDarkmode = !isDarkmode;
          //     widget.setTheme(isDarkmode);
          //   },
          // ),
        ],
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: RameneService.getDataRamene(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    TextField(
                      controller: null,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search ramen...',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins Light',
                          color: lightGrey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: lightGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
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
                    const SizedBox(height: 20),
                    Expanded(
                      child: FutureBuilder<List<RameneModel>>(
                        future: RameneService.fetchRamens(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: snapshot.data!.length,
                                  padding: EdgeInsets.all(10),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            // height: 170,
                                            // width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "${snapshot.data![index].img_url}"),
                                                )),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "${snapshot.data![index].product_name}",
                                          style: TextStyle(
                                            color: lightGrey,
                                            fontFamily: 'Poppins Light',
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "${snapshot.data![index].price}",
                                          style: TextStyle(
                                            color: darkGrey,
                                            fontFamily: 'Poppins Regular',
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
