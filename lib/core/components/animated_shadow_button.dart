import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';

class AnimatedShadowContainer extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final Color? buttonTextColor;
  final Gradient? buttonBackgroundGradient;
  final Color? shadowColor;

  const AnimatedShadowContainer({
    Key? key,
    required this.buttonText,
    this.onTap,
    this.buttonTextColor,
    this.buttonBackgroundGradient,
    this.shadowColor,
  }) : super(key: key);

  @override
  State<AnimatedShadowContainer> createState() =>
      _AnimatedShadowContainerState();
}

class _AnimatedShadowContainerState extends State<AnimatedShadowContainer> {
  late Color _shadowColor;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _shadowColor = widget.shadowColor ?? Colors.grey.withOpacity(0.5);
    _startShadowAnimation();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void _startShadowAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _shadowColor = _getRandomColor();
      });
    });
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: widget.buttonBackgroundGradient ?? primaryGradientColor,
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _shadowColor,
              spreadRadius: 0.7,
              blurRadius: 10,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.buttonText,
              style: TextStyle(
                color: widget.buttonTextColor ?? primaryLightColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: widget.buttonTextColor ?? primaryLightColor,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: primaryLightColor,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
