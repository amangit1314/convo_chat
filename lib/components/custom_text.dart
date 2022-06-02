import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  // final TextAlign textAlign;
  // final TextOverflow textOverflow;
  // final TextStyle style;

  const MyText(
      // this.style,
      // this.textAlign,
      // this.textOverflow,
      {
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = const Color(0xff000000),
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
