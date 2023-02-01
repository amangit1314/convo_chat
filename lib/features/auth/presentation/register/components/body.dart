import 'package:convo_chat/features/auth/presentation/register/components/registration_form.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              children: [
                SizedBox(height: height * .2),
                // Image.asset('assets/others/leaf.jpg', height: 160),
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * .07),
                Text(
                  'Create an account, It\'s free',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
                SizedBox(height: height * .04), // 4%
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ), // 7%
                const RegisterationForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
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
                      width: MediaQuery.of(context).size.width * .15,
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[200],
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Color(0xff2D2B2B),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
