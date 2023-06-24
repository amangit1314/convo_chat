import 'dart:developer';

import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user_model.dart';

class SupportChat extends ConsumerWidget {
  const SupportChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider =
        ref.read(authControllerProvider).getUserData() as UserModel;
    // scaffold with chat ui
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Tawk(
          directChatLink:
              'https://tawk.to/chat/647783acad80445890f04277/1h1pdkn04',
          visitor: TawkVisitor(
            name: authProvider.name ?? 'Convo User',
            email: authProvider.email,
          ),
          onLoad: () {
            log('Hello Tawk!');
          },
          onLinkTap: (String url) {
            log(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
