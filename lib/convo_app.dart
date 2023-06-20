import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/utils/theme/colors.dart';
import 'features/auth/data/controller/auth_controller.dart';
import 'features/nav/presentation/bottom_nav.dart';
import 'features/onboard/presentation/onboard_1.dart';
import 'models/user_model.dart';

final authStateProvider = FutureProvider.autoDispose<UserModel?>((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

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
      home: Consumer(builder: (context, ref, _) {
        final authState = ref.watch(authStateProvider);
        return authState.when(
          data: (user) {
            if (user != null) {
              return const BottomNav();
            } else {
              return const Onboard1Screen();
            }
          },
          loading: () => Center(
            child: Stack(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/convo_logo.png'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Convo',
                        style: TextStyle(
                          fontSize: 30,
                          color: primaryLightColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          error: (err, stackTrace) {
            return const Text('An error occurred');
          },
        );
      }),
    );
  }
}
