import 'package:convo_chat/screens/others/onboard_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convo Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboard1Screen(),
      initialRoute: 'O1Screen',
      routes: {
        'O1Screen': (context) => Onboard1Screen(),
        'O2Screen': (context) => Onboard2Screen(),
      },
    );
  }
}

