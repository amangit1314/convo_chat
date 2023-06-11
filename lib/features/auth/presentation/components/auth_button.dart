import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double textSize;
  final double radius;
  final double height;
  final double width;
  final double borderWidth;
  final FontWeight textWeight;
  final int animationDuration;

  const AuthButton({
    this.animationDuration = 300,
    this.height = 70,
    this.width = double.maxFinite,
    this.radius = 12,
    this.bgColor = const Color(0xff2D2B2B),
    this.textColor = Colors.white,
    this.textSize = 14,
    this.textWeight = FontWeight.w600,
    this.name = 'Login',
    this.onTap,
    this.borderWidth = 0.0,
    Key? key,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: bgColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: textWeight,
            ),
          ),
        ),
      ),
    );
  }
}
