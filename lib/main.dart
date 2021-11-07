import 'package:convo_chat/screens/home/home_screen.dart';
import 'package:convo_chat/screens/others/onboard_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Convo Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'O1Screen',
      routes: {
        'O1Screen': (context) => const Onboard1Screen(),
        'Home': (context) => const Home(child: MyDrawer()),
      },
    );
  }
}
