import 'package:convo_chat/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/routes.dart';

class ConvoApp extends ConsumerWidget {
  // final StreamChatClient client;, required this.client
  const ConvoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'Convo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // home: StreamBuilder(
      //   stream: AuthMethods().auth.authStateChanges(),
      //   builder: ((context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Scaffold(
      //         body: LoadingWidget(color: Theme.of(context).primaryColor),
      //       );
      //     } else if (snapshot.hasData) {
      //       return const BottomNav();
      //     } else if (snapshot.hasError) {
      //       showErrorSnackBar(context, snapshot.error.toString());
      //     }
      //     return const Onboard1Screen();
      //   }),
      // ),
      // builder: (context, child) => StreamChatCore(
      //   client: client,
      //   child: child!,
      // ),
      // home: const BottomNav(),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: ref.watch(userDataAuthProvider).when(
      //       data: (user) {
      //         if (user == null) {
      //           return const Onboard2Screen();
      //         }
      //         return const BottomNav();
      //       },
      //       error: (err, trace) {
      //         return ErrorScreen(
      //           error: err.toString(),
      //         );
      //       },
      //       loading: () => const LoadingWidget(color: Colors.red),
      //     ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return showErrorSnackBar(context, error);
  }
}
