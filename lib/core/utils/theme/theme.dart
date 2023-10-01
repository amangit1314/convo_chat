import 'package:flutter/material.dart';

import '../config/size_config.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle listTitleDefaultTextStyle = const TextStyle(
  color: secondaryColor,
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);

TextStyle listTitleSelectedTextStyle = const TextStyle(
  color: primaryColor,
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.w600,
  color: primaryColor,
  height: 1.5,
);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: textColor),
  );
}

class LightColorTheme {
  // Backgrounds
  static const primaryColor = Color(0xFFFBC386);
  static const primaryDarkColor = Color(0xFFF35307);
  static const secondaryColor = Color(0xFF20454E);
  static const buttonRedColor = Color(0xFFFB655F);

  // Pure Colors
  static const purpleColor = Color(0xFF5B1B72);
  static const darkWhite = Color(0xffC5CBCC);
  static const lightRed = Color(0xffFF9B85);
  static const yellow = Color(0xffDED9C4);
  static const white = Colors.white;
  static const lightBlack = Color(0xff001D21);
  static const greyColor = Color(0xff8B989A);
  static const greyShaded300 = Color(0xffC4C4C4);
  static const Color lightYellow = Color(0xffFFF2BD);
  static const Color lightGreyColor = Color(0xffEBEBEB);

  // Text Colors
  static Color darkTextColor = Colors.grey.shade900;
  static Color headingTextColor = darkTextColor;
  static Color normalTextColor = greyColor;

  // Other Colors
  static Color noDataDarkColor = primaryDarkColor.withOpacity(0.70);
  static const noDataYellowColor = Color(0xFFFFC847);
}

class DarkColorTheme {
  // Backgrounds
  static const primaryColor = Color(0xFFFBC386);
  static const primaryDarkColor = Color(0xFFF35307);
  static const secondaryColor = Color(0xFF20454E);
  static const buttonRedColor = Color(0xFFFB655F);

  // Pure Colors
  static const purpleColor = Color(0xFF5B1B72);
  static const darkWhite = Color(0xffC5CBCC);
  static const lightRed = Color(0xffFF9B85);
  static const yellow = Color(0xffDED9C4);
  static const lightBlack = Color(0xff001D21);
  static const greyColor = Color(0xff8B989A);
  static const greyShaded300 = Color(0xffC4C4C4);
  static const Color lightYellow = Color(0xffFFF2BD);
  static const Color lightGreyColor = Color(0xffEBEBEB);

  // Other Colors
  static const noDataYellowColor = Color(0xFFFFC847);
  static Color noDataDarkColor = primaryDarkColor.withOpacity(0.70);
}

class ConvoAppColorTheme {
  ConvoAppColorTheme._();
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColorDark: Colors.deepOrange,
    primaryColorLight: const Color(0xFFFBC386),
    disabledColor: const Color(0xffFF9B85),
    unselectedWidgetColor: const Color(0xFF20454E),
    shadowColor: const Color(0xffC4C4C4),
    indicatorColor: const Color(0xFF5B1B72),
    hintColor: Colors.white60,
    focusColor: const Color(0xFFFFC847),
    canvasColor: Colors.white,
    brightness: Brightness.light,
    textTheme: ConvoAppTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColorDark: Colors.deepOrange,
    primaryColorLight: const Color(0xFFFBC386),
    disabledColor: const Color(0xffFF9B85),
    unselectedWidgetColor: const Color(0xFF20454E),
    shadowColor: const Color(0xffC4C4C4),
    indicatorColor: const Color(0xFF5B1B72),
    hintColor: Colors.white60,
    focusColor: const Color(0xFFFFC847),
    brightness: Brightness.dark,
    textTheme: ConvoAppTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(),
    canvasColor: Colors.grey.shade900,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
  );
}

class ConvoAppTextTheme {
  static TextTheme lightTextTheme = GoogleFonts.josefinSansTextTheme().copyWith(
    displayMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.grey.shade900,
        fontSize: 18,
      ),
    ),
  );

  static TextTheme darkTextTheme = GoogleFonts.josefinSansTextTheme().copyWith(
    displayMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xffC4C4C4),
        fontSize: 14,
      ),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
