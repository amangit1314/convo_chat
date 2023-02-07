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
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
            SizedBox(height: height * .08),
            const Text(
              'Login',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * .025),
            Text(
              'Enter your credentials to sign in and \nchat freely with your contacts, enjoy',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(.8),
              ),
            ),
            SizedBox(height: height * .04),
            const LoginForm(),
            SizedBox(height: height * .06),
            Text(
              "continue with social media",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black54),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // try {
                    //   ref
                    //       .read(authRepositoryProvider)
                    //       .signInWithGoogle(context);
                    // } catch (e) {
                    //   if (e is FirebaseAuthException) {
                    //     SnackBar(content: Text(e.message!));
                    //   }
                    // }
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[200],
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xff2D2B2B),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[200],
                  child: const FaIcon(
                    FontAwesomeIcons.apple,
                    color: Color(0xff2D2B2B),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[200],
                  child: const FaIcon(
                    FontAwesomeIcons.phone,
                    color: Color(0xff2D2B2B),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            const Divider(height: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
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
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
