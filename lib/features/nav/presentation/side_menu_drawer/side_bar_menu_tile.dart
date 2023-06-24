import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/theme/colors.dart';

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
