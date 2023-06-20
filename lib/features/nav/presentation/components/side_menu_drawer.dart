import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/groups/presentation/groups_screen.dart';
import 'package:convo_chat/features/home/presentation/home_screen.dart';
import 'package:convo_chat/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../auth/presentation/login/login_screen.dart';
import 'info_card.dart';

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({super.key});

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  bool isActive = false; // Track the active state of the menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: primaryColor,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Aman",
                nickName: "Mysterious Hulk",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(color: Colors.white24, height: 1),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 24, bottom: 16),
                    child: Text(
                      "Browse".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                  SideBarMenuTile(
                    title: 'Chats',
                    icon: FontAwesomeIcons.facebookMessenger,
                    isActive: isActive,
                    press: () {
                      setState(() {
                        isActive = !isActive;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  SideBarMenuTile(
                    title: 'Groups',
                    icon: FontAwesomeIcons.userGroup,
                    isActive: isActive,
                    press: () {
                      setState(() {
                        isActive = !isActive;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const GroupsScreen(),
                        ),
                      );
                    },
                  ),
                  SideBarMenuTile(
                    title: 'Calls',
                    icon: FontAwesomeIcons.mobile,
                    isActive: isActive,
                    press: () {
                      setState(() {
                        isActive = !isActive;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  SideBarMenuTile(
                    title: 'Profile',
                    icon: FontAwesomeIcons.solidCircleUser,
                    isActive: isActive,
                    press: () {
                      setState(() {
                        isActive = !isActive;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white24, height: 1),
                  const SizedBox(height: 20),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .9,
                    bottom: 0,
                    child: SideBarMenuTile(
                      title: 'Sign Out',
                      icon: FontAwesomeIcons.arrowRightToBracket,
                      isActive: isActive,
                      press: () {
                        setState(() {
                          isActive = !isActive;
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideBarMenuTile extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;
  final bool isActive;
  final String title;

  const SideBarMenuTile({
    Key? key,
    required this.icon,
    required this.press,
    required this.isActive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 300),
          height: 56,
          width: isActive ? 288 : 0,
          left: isActive ? 0 : 288,
          child: Container(
            decoration: const BoxDecoration(
              color: popColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 24),
                SizedBox(
                  height: 34,
                  width: 34,
                  child: FaIcon(
                    icon,
                    color: Colors.white.withOpacity(.85),
                  ),
                ),
                const SizedBox(width: 24),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
