import 'package:convo_chat/features/auth/presentation/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/components/custom_text.dart';
import '../../register/register_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void navigateToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      ),
    );
  }

  // void navigateToGenerateOtpScreen() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => const GenerateOtpScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: ListView(
          children: [
            // Container(
            //   height: 160,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       fit: BoxFit.cover,
            //       image: AssetImage('assets/green.webp'),
            //     ),
            //   ),
            // ),
            SizedBox(height: height * .15),
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * .01),
            Text(
              textAlign: TextAlign.center,
              'Use your account to sign in and use this application, enjoy',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: height * .08),
            const LoginForm(),
            SizedBox(height: height * .06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //onTap: () => navigateToGenerateOtpScreen(),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[200],
                    child: const FaIcon(
                      FontAwesomeIcons.phone,
                      color: Color(0xff2D2B2B),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  // onTap: () => ref
                  //     .read(authRepositoryProvider)
                  //     .signInWithGoogle(context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[200],
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xff2D2B2B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  text: 'Don`t have account?',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 4),
                TextButton(
                  child: const MyText(
                    text: 'Sign Up',
                    color: Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  onPressed: () => navigateToRegister(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
