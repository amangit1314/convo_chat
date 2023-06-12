import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  final String userName;
  final String email;
  const ProfileBody({Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {},
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
