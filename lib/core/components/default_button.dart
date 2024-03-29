import 'package:flutter/material.dart';

import '../../core/utils/config/size_config.dart';
import '../../core/utils/theme/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color txtColor;
  final Color btnColor;
  final double height;

  const DefaultButton({
    this.txtColor = Colors.black,
    this.btnColor = primaryColor,
    Key? key,
    this.height = 55,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
