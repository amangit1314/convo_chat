import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/theme/colors.dart';
import '../../models/user_model.dart';
import '../auth/data/controller/auth_controller.dart';
import '../nav/presentation/bottom_nav.dart';
import '../onboard/presentation/onboard_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getAuthState();
  }

  AutoDisposeFutureProvider<UserModel?> getAuthState() {
    final authStateProvider = FutureProvider.autoDispose<UserModel?>((ref) {
      final authController = ref.watch(authControllerProvider);
      return authController.getUserData();
    });

    return authStateProvider;
  }

  navigateAfterDuration() {
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final authState = ref.watch(getAuthState());
        return authState.when(
          data: (user) {
            if (user != null) {
              return const BottomNav();
            } else {
              return const Onboard1Screen();
            }
          },
          loading: () {
            return const LoginScreen();
          },
          error: (err, stackTrace) {
            return const Center(
              child: Text(
                'An error occurred',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          },
        );
      },
    );
  }

  Widget splashView() {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Stack(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/convo_logo.png'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 130.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
    );
  }
}
