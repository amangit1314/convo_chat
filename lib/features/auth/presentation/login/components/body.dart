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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .07),
            const Text(
              'Hello Again!',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * .01),
            Text(
              //'Enter your credentials to sign in and \nchat freely with your contacts, enjoy',
              // 'Sign in with credentials and enjoy',
              'Welcome back here we \n missed you so much',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: textColor),
            ),
            SizedBox(height: size.height * .04),
            const LoginForm(),
            SizedBox(height: size.height * .04),
            const Divider(height: 1),
            SizedBox(height: size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Not a memeber?',
                  fontSize: 12,
                  color: textColor,
                ),
                const SizedBox(width: 2),
                TextButton(
                  child: const CustomText(
                    text: 'Register now',
                    fontSize: 12,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600,
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
