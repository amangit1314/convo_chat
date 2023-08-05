import 'package:flutter/material.dart';

class SlidingIndicator extends StatelessWidget {
  const SlidingIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withOpacity(.9),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
