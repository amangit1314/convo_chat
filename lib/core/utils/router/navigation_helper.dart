import 'package:flutter/material.dart';

nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

nextScreenRemoveUntil(context, Widget page) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => page), (Route route) => false);
}
