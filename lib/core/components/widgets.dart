import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: primaryColor, fontWeight: FontWeight.normal),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: popColor, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: popColor, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: popColor, width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  GetSnackBar(
    titleText: Text(
      message.toString(),
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    mainButton: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  );
}
