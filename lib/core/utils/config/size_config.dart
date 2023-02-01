import 'package:flutter/material.dart';

class SizeConfig {
  static double _designWidth = 360;
  static double _designHeight = 800;

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late Orientation orientation;

  static void init(
      BuildContext context, double designWidth, double designHeight) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    _designWidth = designWidth;
    _designHeight = designHeight;

    blockSizeHorizontal = screenWidth / _designWidth;
    blockSizeVertical = screenHeight / _designHeight;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    return inputHeight * blockSizeVertical;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return inputWidth * blockSizeHorizontal;
  }
}
