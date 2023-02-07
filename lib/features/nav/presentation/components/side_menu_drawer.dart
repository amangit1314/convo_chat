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
  // RiveAsset selectedMenu = sideMenus.first;
  // var selectedMenu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xff22211F),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Aman",
                nickName: "Mysterious Hulk",
              ),
              Column(
                children: [
                  const Divider(color: Colors.white24, height: 1),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 32,
                      bottom: 16,
                    ),
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
                      icon: FontAwesomeIcons.message,
                      // isActive: false,
                      press: () {
                        // setState(() {
                        //   selectedMenu = true;
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }),
                  SideBarMenuTile(
                      title: 'Groups',
                      icon: FontAwesomeIcons.peopleGroup,
                      // isActive: false,
                      press: () {
                        // setState(() {
                        //   selectedMenu = true;
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const GroupsScreen(),
                          ),
                        );
                      }),
                  SideBarMenuTile(
                      title: 'Calls',
                      icon: FontAwesomeIcons.video,
                      // isActive: false,
                      press: () {
                        // setState(() {
                        //   selectedMenu = true;
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }),
                  SideBarMenuTile(
                      title: 'Profile',
                      icon: FontAwesomeIcons.person,
                      // isActive: false,
                      press: () {
                        // setState(() {
                        //   selectedMenu = true;
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                        // Navigator.of(context).pushNamed(menu[2]);
                      }),
                  SideBarMenuTile(
                      title: 'Sign Out',
                      icon: FontAwesomeIcons.arrowRightToBracket,
                      // isActive: false,
                      press: () {
                        // setState(() {
                        //   selectedMenu = true;
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }),
                  // ...sideMenus.map(
                  //   (menu) => SideMenuTile(
                  //     menu: menu,
                  //     press: () {
                  //       menu.input!.change(true);
                  //       Future.delayed(const Duration(seconds: 1), () {
                  //         menu.input!.change(false);
                  //       });
                  //       setState(() {
                  //         selectedMenu = menu;
                  //       });
                  //     },
                  // riveonInit: (artboard) {
                  //   StateMachineController controller =
                  //       RiveUtils.getRiveController(
                  //     artboard,
                  //     stateMachineName: menu.stateMachineName,
                  //   );
                  //   menu.input = controller.findSMI("active") as SMIBool;
                  // },
                  //     isActive: selectedMenu == menu,
                  //   ),
                  // )
                  // ...navItems.map(
                  //   (menu) => SideBarMenuTile(
                  //     title: navItems[0][1],
                  //     icon: navItems[0][0],
                  //     isActive: selectedMenu == menu,
                  //     press: () {
                  //       setState(() {
                  //         selectedMenu = menu;
                  //       });
                  //       Navigator.of(context).pushNamed(menu[2]);
                  //     },
                  //   ),
                  // ),
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
  // final bool isActive;
  final String title;

  const SideBarMenuTile({
    Key? key,
    required this.icon,
    required this.press,
    // required this.isActive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // AnimatedPositioned(
        //   curve: Curves.fastOutSlowIn,
        //   duration: const Duration(milliseconds: 300),
        //   height: 56,
        //   width: isActive ? 288 : 0,
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: Colors.deepPurpleAccent,
        //       borderRadius: BorderRadius.all(Radius.circular(12)),
        //     ),
        //   ),
        // ),
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
