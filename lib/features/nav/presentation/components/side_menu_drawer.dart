import 'package:convo_chat/core/utils/rive_utils.dart';
import 'package:convo_chat/features/nav/models/rive_asset.dart';
import 'package:convo_chat/features/nav/presentation/components/side_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({super.key});

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  RiveAsset selectedMenu = sideMenus.first;

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
                  ...sideMenus.map(
                    (menu) => SideMenuTile(
                      menu: menu,
                      press: () {
                        menu.input!.change(true);
                        Future.delayed(const Duration(seconds: 1), () {
                          menu.input!.change(false);
                        });
                        setState(() {
                          selectedMenu = menu;
                        });
                      },
                      riveonInit: (artboard) {
                        StateMachineController controller =
                            RiveUtils.getRiveController(
                          artboard,
                          stateMachineName: menu.stateMachineName,
                        );
                        menu.input = controller.findSMI("active") as SMIBool;
                      },
                      isActive: selectedMenu == menu,
                    ),
                  )
                ],
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
                      "History".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                  ...sideMenus2.map(
                    (menu) => SideMenuTile(
                      menu: menu,
                      press: () {
                        menu.input!.change(true);
                        Future.delayed(const Duration(seconds: 1), () {
                          menu.input!.change(false);
                        });
                        setState(() {
                          selectedMenu = menu;
                        });
                      },
                      riveonInit: (artboard) {
                        StateMachineController controller =
                            RiveUtils.getRiveController(
                          artboard,
                          stateMachineName: menu.stateMachineName,
                        );
                        menu.input = controller.findSMI("active") as SMIBool;
                      },
                      isActive: selectedMenu == menu,
                    ),
                  )
                  // signout tile
                  ,
                  const ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.rightFromBracket,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.white70),
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
