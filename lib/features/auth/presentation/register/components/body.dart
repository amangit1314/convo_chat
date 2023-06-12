import 'package:convo_chat/features/auth/presentation/register/components/registration_form.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_text.dart';
import '../../../../../core/utils/theme/colors.dart';
import '../../login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * .07),
              const Text(
                'Register Here!',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height * .01),
              Text(
                'Enter your credentials to create \n  Free Account',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: textColor),
              ),
              SizedBox(height: size.height * .04),
              const RegisterationForm(),
              SizedBox(height: size.height * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Already have an account?',
                    fontSize: 12,
                  ),
                  SizedBox(width: size.width * .02),
                  TextButton(
                    child: const MyText(
                      text: 'Login',
                      fontSize: 12,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
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
              SizedBox(height: size.height * .02),
              const Divider(height: 1),
              SizedBox(height: size.height * .02),
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
    );
  }
}
