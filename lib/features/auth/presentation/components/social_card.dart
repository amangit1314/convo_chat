import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final FaIcon? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey[200],
        child: Center(child: icon),
      ),
    );
  }
}
