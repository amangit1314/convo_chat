import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/onboard/presentation/onboard_1.dart';

class ConvoApp extends ConsumerWidget {
  const ConvoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
        title: 'Convo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: (settings) => generateRoute(settings),
        home: const Onboard1Screen()
        // home: Consumer(builder: (context, ref, _) {
        //   final authState = ref.watch(authStateProvider);
        //   return authState.when(
        //     data: (user) {
        //       if (user != null) {
        //         return const BottomNav();
        //       } else {
        //         return const Onboard1Screen();
        //       }
        //     },
        //     loading: () => const Center(child: CircularProgressIndicator()),
        //     error: (err, stackTrace) {
        //       return const Text('An error occurred');
        //     },
        //   );
        // }),

        );
  }
}
