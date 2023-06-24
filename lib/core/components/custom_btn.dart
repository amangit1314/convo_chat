import 'package:convo_chat/core/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  const CustomBtn({
    Key? key,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    required this.text,
    required this.press,
    required this.color,
    required this.width,
    this.height = 55,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
