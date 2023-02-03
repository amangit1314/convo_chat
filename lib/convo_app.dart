import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/nav/presentation/bottom_nav.dart';

class ConvoApp extends StatelessWidget {
  const ConvoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(create: (_) => UserProvider()),
        //   ],
        //   child:
        GetMaterialApp(
      title: 'Convo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const BottomNav(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: ((context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Scaffold(
      //           body: LoadingWidget(color: Theme.of(context).primaryColor));
      //     } else if (snapshot.hasData) {
      //       return const BottomNav();
      //     } else if (snapshot.hasError) {
      //       showErrorSnackBar(context, snapshot.error.toString());
      //     }
      //     return const LoginScreen();
      //   }),
      // ),
      // ),
    );
  }
}
