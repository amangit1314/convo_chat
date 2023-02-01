import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int? index;
  final double? height;
  final Color? color;
  const Indicator({
    Key? key,
    this.index,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
