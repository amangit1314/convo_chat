import 'package:flutter/material.dart';

// * ....... ---------- correct colors 👇 ------------ .......
const primaryColor = Color(0xff22211F);
const primaryLightColor = Color.fromARGB(255, 255, 255, 255);
const secondaryColor = Color(0xFF979797);
// const textColor = Color(0xFF757575);
Color textColor = Colors.black.withOpacity(.6);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xff22211F), Color.fromARGB(255, 0, 0, 0)],
);
const secondaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF), Color(0xFF979797)],
);
const greyColor = Colors.grey;
const blackColor = Colors.black;
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const dividerColor = Color.fromRGBO(37, 45, 50, 1);
