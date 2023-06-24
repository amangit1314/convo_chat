import 'package:convo_chat/core/components/components.dart';
import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:convo_chat/features/group_chat/presentation/groups_screen.dart';
import 'package:convo_chat/features/home/presentation/home_screen.dart';
import 'package:convo_chat/features/nav/presentation/side_menu_drawer/side_bar_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../profile/presentation/profile_screen.dart';
import 'info_card.dart';

class SideMenuDrawer extends ConsumerStatefulWidget {
  const SideMenuDrawer({super.key});

  @override
  ConsumerState<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends ConsumerState<SideMenuDrawer> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(authControllerProvider);
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
              const InfoCard(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(color: Colors.white24, height: 1),
                  ),
                  SideBarMenuTile(
                    title: 'Chats',
                    icon: FontAwesomeIcons.facebookMessenger,
                    isActive: activeIndex == 0,
                    press: () {
                      setState(() {
                        activeIndex = 0;
                      });
                      nextScreen(context, const HomeScreen());
                    },
                  ),
                  SideBarMenuTile(
                    title: 'Groups',
                    icon: FontAwesomeIcons.userGroup,
                    isActive: activeIndex == 1,
                    press: () {
                      setState(() {
                        activeIndex = 1;
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
                    isActive: activeIndex == 2,
                    press: () {
                      setState(() {
                        activeIndex = 2;
                      });
                      nextScreen(context, const CallsScreen());
                    },
                  ),
                  SideBarMenuTile(
                    title: 'Profile',
                    icon: FontAwesomeIcons.solidCircleUser,
                    isActive: activeIndex == 3,
                    press: () {
                      setState(() {
                        activeIndex = 3;
                      });
                      nextScreen(
                        context,
                        const Profile(userName: '', email: ''),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Divider(color: Colors.white24, height: 1),
                  ),
                  SideBarMenuTile(
                    title: 'Sign Out',
                    icon: FontAwesomeIcons.arrowRightToBracket,
                    isActive: activeIndex == 4,
                    press: () {
                      setState(() {
                        activeIndex = 4;
                      });
                      authProvider.signOut();
                    },
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
