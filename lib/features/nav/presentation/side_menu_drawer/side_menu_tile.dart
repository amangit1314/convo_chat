import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../models/rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  const SideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive,
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
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInit,
            ),
          ),
          title: Text(
            menu.title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
