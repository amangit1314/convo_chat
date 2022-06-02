//import 'package:convo_chat/screens/auth/login_screen.dart';
import 'package:convo_chat/screens/home/home_screen.dart';
import 'package:convo_chat/screens/home/my_drawer.dart';
import 'package:convo_chat/screens/others/onboard_1.dart';
import 'package:convo_chat/screens/others/onboard_2.dart';
import 'package:convo_chat/utils/colors.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB6LkpxFhpvfrpEbOYOq1yAHeJpT9xi88s",
        authDomain: "convo-chat-fe48f.firebaseapp.com",
        projectId: "convo-chat-fe48f",
        storageBucket: "convo-chat-fe48f.appspot.com",
        messagingSenderId: "982105301472",
        appId: "1:982105301472:web:9c66bd338f0d2d3cc08b85",
        measurementId: "G-X6GH85VVVT",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convo Chat',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      debugShowCheckedModeBanner: false,
      initialRoute: 'O1Screen',
      routes: {
        'O1Screen': (context) => const Onboard1Screen(),
        'Home': (context) => const Home(child: MyDrawer()),
      },
      home: const Onboard2Screen(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (ctx, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.hasData) {
      //         return const Home(child: MyDrawer());
      //       } else if (snapshot.hasError) {
      //         return Center(
      //           child: Text('${snapshot.hasError}'),
      //         );
      //       }
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.black,
      //         ),
      //       );
      //     }
      //     return const Login();
      //   },
      // ),
    );
  }
}
