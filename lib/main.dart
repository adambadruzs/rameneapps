import 'package:flutter/material.dart';
import 'package:rameneapps/screens/home.dart';
import 'package:rameneapps/screens/splash.dart';
import 'package:rameneapps/shared_pref.dart';

Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.
  SharedPref.init() perlu memanggil kode asli untuk menginisialisasi, oleh karena itu 
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkmode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();

      /* simpan nilai boolean pada shared preferences */
      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
    });
  }

  /* hanya dijalankan sekali ketika halaman / class MyApp pertama kali di jalankan */
  @override
  void initState() {
    /* default / tema awal dibuat sesuai data yang tersimpan pada shared preferences
    atau jika masih kosong (belum ada yang set) maka akan di berikan nilai false */
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      /* fungsi set theme dijadikan sebuah parameter pada home page
      agar dapat dijalankan pada class tersebut */
      home: Homes(setTheme: setTheme),
    );
  }
}
