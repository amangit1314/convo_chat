import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDrawerButton extends StatelessWidget {
  final VoidCallback press;
  // final ValueChanged<Artboard> riveOnInit;
  final String svgIcon;
  final bool? isOpened;

  const MenuDrawerButton({
    Key? key,
    required this.press,
    this.isOpened = false,
    // required this.riveOnInit,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOpened! ? Colors.transparent : Colors.white,
          ),
          child: Center(
            child: SvgPicture.asset(
              svgIcon,
              height: 19,
            ),
          ),
        ),
      ),
    );
  }
}
