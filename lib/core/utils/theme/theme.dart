import 'package:flutter/material.dart';

import '../config/size_config.dart';
import 'colors.dart';

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
