import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class MenuDrawerButton extends StatelessWidget {
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final String svgIcon;

  const MenuDrawerButton({
    Key? key,
    required this.press,
    required this.riveOnInit,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          // child: RiveAnimation.asset(
          //   "assets/riveAsset/menu_button.riv",
          //   onInit: riveOnInit,
          // ),
          child: Center(
              //'assets/svg/nav.svg',
              child: SvgPicture.asset(
            svgIcon,
            height: 19,
          )),
        ),
      ),
    );
  }
}
