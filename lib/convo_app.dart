import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'features/auth/data/providers/user_provider.dart';
import 'features/auth/presentation/login/login_screen.dart';
import 'features/nav/presentation/bottom_nav.dart';

class ConvoApp extends StatelessWidget {
  const ConvoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(
        title: 'Convo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: StreamBuilder(
          stream: null,
          //stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasData) {
              return const BottomNav();
            } else if (snapshot.hasError) {
              Get.snackbar(
                "Error",
                snapshot.error.toString(),
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.red,
              );
            }
            return const LoginScreen();
          }),
        ),
      ),
    );
  }
}
