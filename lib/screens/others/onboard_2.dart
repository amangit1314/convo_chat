import 'package:convo_chat/components/custom_btn.dart';
import 'package:convo_chat/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboard2Screen extends StatelessWidget {
  const Onboard2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('./assets/svg/ilt1.svg'),
          const SizedBox(height: 20),
          const MyText(
            text: 'Freely chat with anyone!',
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 5),
          const MyText(
            text:
                'A secured and beautiful app to experience chat with friends, family and contacts.🤩🤩',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 50),
          CustomBtn(
            Colors.white,
            0,
            Colors.transparent,
            text: 'Login',
            press: () {},
            color: const Color(0xff2D2B2B),
            width: 331,
            height: 60,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            borderRadius: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: const MyText(
              text: 'SignUp',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            children: [
              Image.asset('assets/images/Vector.png'),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: MyText(
                  text: 'Help?',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
