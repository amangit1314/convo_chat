import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/utils/theme/colors.dart';
import 'onboard_2.dart';

class Onboard1Screen extends StatelessWidget {
  static const routeName = '/onboard1';
  const Onboard1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Spacer(),
              Stack(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/convo_logo.png'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Convo',
                          style: TextStyle(
                            fontSize: 30,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Freely chat with anyone!',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                    child: Text(
                      'A secured and beautiful app to chat with friends, family and contacts.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: AnimatedShadowContainer(),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedShadowContainer extends StatefulWidget {
  const AnimatedShadowContainer({super.key});

  @override
  State<AnimatedShadowContainer> createState() =>
      _AnimatedShadowContainerState();
}

class _AnimatedShadowContainerState extends State<AnimatedShadowContainer> {
  Color shadowColor = Colors.grey.withOpacity(0.5);

  @override
  void initState() {
    super.initState();
    startShadowAnimation();
  }

  void startShadowAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        shadowColor = getRandomColor();
      });
    });
  }

  Color getRandomColor() {
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Onboard2Screen()),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: primaryGradientColor,
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
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
            const Text(
              "Get Started",
              style: TextStyle(
                color: primaryLightColor,
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
                  color: primaryLightColor,
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
