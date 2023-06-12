import 'package:convo_chat/core/components/custom_text.dart' show MyText;
import 'package:convo_chat/features/auth/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/presentation/components/auth_button.dart';
import '../../auth/presentation/login/login_screen.dart';

class Onboard2Screen extends StatelessWidget {
  static const routeName = '/onboard2';
  const Onboard2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          SvgPicture.asset('./assets/svg/ilt1.svg', height: 240, width: 240),
          const Spacer(),
          const Center(
            child: Text(
              'Freely chat with anyone!',
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 31.0, right: 31),
            child: Text(
              'A secured and beautiful app to chat with friends, family and contacts.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: AuthButton(
              onTap: () {
                // Navigator.of(context).pushNamed(RegisterScreen.routeName);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
              name: 'Login',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(RegisterScreen.routeName);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
                  ),
                );
              },
              child: const MyText(
                text: 'Register',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: MyText(
              text: 'Help?',
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
