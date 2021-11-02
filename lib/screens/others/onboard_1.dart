import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboard1Screen extends StatelessWidget {
  const Onboard1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D2B2B),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/bg.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
