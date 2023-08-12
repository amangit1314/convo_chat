import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';

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
