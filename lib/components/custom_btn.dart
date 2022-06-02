import 'package:convo_chat/components/custom_text.dart';
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

  const CustomBtn(
    this.textColor,
    this.borderWidth,
    this.borderColor, {
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.fontWeight,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
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
        child: MyText(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
