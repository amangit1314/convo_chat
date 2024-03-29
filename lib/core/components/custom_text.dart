import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = const Color(0xff000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
