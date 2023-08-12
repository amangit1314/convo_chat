import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../profile/presentation/profile_screen.dart';
import 'info_card.dart';
import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:convo_chat/features/group_chat/presentation/groups_screen.dart';
import 'package:convo_chat/features/home/presentation/home_screen.dart';
import 'package:convo_chat/features/nav/presentation/side_menu_drawer/side_bar_menu_tile.dart';
import 'package:convo_chat/core/components/components.dart';

class SideMenuDrawer extends ConsumerStatefulWidget {
  const SideMenuDrawer({super.key});

  @override
  ConsumerState<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends ConsumerState<SideMenuDrawer> {
  int activeIndex = 0;

  void handleMenuItemPress(int index, Widget screen) {
    setState(() {
      activeIndex = index;
    });
    nextScreen(context, screen);
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const InfoCard(),
                  const Divider(color: Colors.white24, height: 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SideBarMenuTile(
                        title: 'Chats',
                        icon: FontAwesomeIcons.facebookMessenger,
                        isActive: activeIndex == 0,
                        press: () => handleMenuItemPress(0, const HomeScreen()),
                      ),
                      SideBarMenuTile(
                        title: 'Groups',
                        icon: FontAwesomeIcons.peopleGroup,
                        isActive: activeIndex == 1,
                        press: () =>
                            handleMenuItemPress(1, const GroupsScreen()),
                      ),
                      SideBarMenuTile(
                        title: 'Calls',
                        icon: FontAwesomeIcons.mobile,
                        isActive: activeIndex == 2,
                        press: () =>
                            handleMenuItemPress(2, const CallsScreen()),
                      ),
                      SideBarMenuTile(
                        title: 'Profile',
                        icon: FontAwesomeIcons.solidCircleUser,
                        isActive: activeIndex == 3,
                        press: () => handleMenuItemPress(
                          3,
                          const Profile(userName: '', email: ''),
                        ),
                      ),
                    ],
                  ),
                ],
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
        ),
      ),
    );
  }
}
