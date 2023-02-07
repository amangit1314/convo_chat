import 'package:convo_chat/features/auth/presentation/register/components/registration_form.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_text.dart';
import '../../login/login_screen.dart';

// import '../../../domain/reposittory/auth_repository.dart';
// ConsumerWidget

class Body extends StatelessWidget {
  const Body({super.key});
// , WidgetRef ref
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .08),
                // Image.asset('assets/others/leaf.jpg', height: 160),
                const Text(
                  'Register',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * .025),
                Text(
                  'Create an account, It\'s free',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ), // 7%
                const RegisterationForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                // Text(
                //   "continue with social media",
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodySmall!
                //       .copyWith(color: Colors.black54),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         // try {
                //         //   ref
                //         //       .read(authRepositoryProvider)
                //         //       .signInWithGoogle(context);
                //         // } catch (e) {
                //         //   if (e is FirebaseAuthException) {
                //         //     SnackBar(content: Text(e.message!));
                //         //   }
                //         // }
                //       },
                //       child: CircleAvatar(
                //         radius: 22,
                //         backgroundColor: Colors.grey[200],
                //         child: const FaIcon(
                //           FontAwesomeIcons.google,
                //           color: Color(0xff2D2B2B),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width * .05,
                //     ),
                //     CircleAvatar(
                //       radius: 22,
                //       backgroundColor: Colors.grey[200],
                //       child: const FaIcon(
                //         FontAwesomeIcons.apple,
                //         color: Color(0xff2D2B2B),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .026,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyText(
                      text: 'Already have an account?',
                      fontSize: 12,
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      child: const MyText(
                        text: 'Login',
                        fontSize: 13,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                const Divider(height: 1),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
