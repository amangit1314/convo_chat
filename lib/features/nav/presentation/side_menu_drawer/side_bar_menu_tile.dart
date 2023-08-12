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
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 300),
            height: 56,
            width: isActive ? 288 : 0,
            left: isActive ? 0 : 288,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: popColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  icon,
                  color: Colors.white.withOpacity(.85),
                  size: 24,
                ),
                const SizedBox(width: 24),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
