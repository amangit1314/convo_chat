import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:convo_chat/features/profile/presentation/help_center.dart';
import 'package:convo_chat/features/profile/presentation/my_account.dart';
import 'package:convo_chat/features/profile/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/components/widgets.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends ConsumerWidget {
  final String userName;
  final String email;
  const ProfileBody({Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        Column(
          children: [
            ProfilePic(),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => nextScreen(context, const MyAccount()),
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () => nextScreen(context, const Settings()),
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () => nextScreen(context, const HelpCenter()),
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () => ref.read(authControllerProvider).signOut(),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
