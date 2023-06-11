import 'package:convo_chat/features/auth/data/repository/auth_repository.dart';
import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../nav/presentation/bottom_nav.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    return user.when(
      data: (user) {
        if (user != null) {
          return const BottomNav();
        } else {
          return const LoginScreen();
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Center(child: Text('Error')),
    );
  }
}
