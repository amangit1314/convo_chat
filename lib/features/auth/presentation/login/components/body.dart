import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/auth/presentation/login/components/login_form.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_text.dart';
import '../../register/register_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .08),
            const Text(
              'Login',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * .008),
            const Text(
              //'Enter your credentials to sign in and \nchat freely with your contacts, enjoy',
              'Sign in with credentials and enjoy',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
            SizedBox(height: size.height * .04),
            const LoginForm(),
            SizedBox(height: size.height * .04),
            const Divider(height: 1),
            SizedBox(height: size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  text: 'Don\'t have an account?',
                  fontSize: 12,
                ),
                const SizedBox(width: 2),
                TextButton(
                  child: const MyText(
                    text: 'Register',
                    fontSize: 13,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
