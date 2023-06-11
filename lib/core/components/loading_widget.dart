import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final bool isCenter;

  const LoadingWidget({
    super.key,
    this.isCenter = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isCenter
        ? Center(child: CircularProgressIndicator(color: color))
        : CircularProgressIndicator(color: color);
  }
}
