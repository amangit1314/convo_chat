import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/components/custom_text.dart';
import '../../../../../core/components/text_field_input.dart';
import '../../../../../core/utils/router/navigation_helper.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../nav/presentation/bottom_nav.dart';
import '../../../data/controller/auth_controller.dart';
import '../../components/auth_button.dart';
import '../../components/social_card.dart';
import '../../otp/generate_otp_screen.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordValid = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void loginUser() async {
    if (formKey.currentState!.validate()) {
      final String result =
          await ref.read(authControllerProvider).signInWithEmailAndPassword(
                _emailController.text,
                _passwordController.text,
              );

      if (result == 'success') {
        if (!mounted) return;
        nextScreenRemoveUntil(context, const BottomNav());
        showSnackbar(
          context,
          Colors.green,
          'Auth Successfull',
          "Authentication is successfull 🎉",
        );
      } else {
        if (!mounted) return;
        showSnackbar(
          context,
          Colors.red,
          'Auth Error',
          "Authentication error occur 😣",
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authController = ref.watch(authControllerProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: size.height * .015),
          buildPasswordFormField(),
          SizedBox(height: size.height * .035),
          AuthButton(
            onTap: loginUser,
            name: 'Login',
            bgColor: primaryColor,
          ),
          SizedBox(height: size.height * .02),
          Row(
            children: [
              const Spacer(),
              CustomText(
                text: 'forgot password?',
                fontSize: 12,
                color: textColor,
              ),
            ],
          ),
          SizedBox(height: size.height * .04),
          Text(
            "continue with social media",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: textColor),
          ),
          SizedBox(height: size.height * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                onTap: () {
                  authController.signInWithGoogle().then(
                    (value) {
                      nextScreenRemoveUntil(context, const BottomNav());
                    },
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  size: 18,
                  color: primaryColor,
                ),
              ),
              SizedBox(width: size.width * .05),
              SocialCard(
                onTap: () {
                  nextScreen(context, const GenerateOtpScreen());
                },
                icon: const FaIcon(
                  FontAwesomeIcons.phone,
                  size: 18,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFieldInput buildPasswordFormField() {
    return TextFieldInput(
      textEditingController: _passwordController,
      hintText: 'Enter Password',
      labelText: 'Password',
      preIcon: const Icon(Icons.fingerprint),
      suffixicon: IconButton(
        icon: Icon(
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
      ),
      textInputType: TextInputType.text,
      contentPadding: 22,
      isPass: _passwordVisible ? false : true,
      onSaved: (newValue) => _passwordController.text = newValue!,
      onChanged: (value) {
        // Validate password length
        if (value!.length < 8) {
          addError(error: "Password is too short");
        } else {
          removeError(error: "Password is too short");
        }

        // Check for special character
        if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          addError(error: "Password must contain at least 1 special character");
        } else {
          removeError(
              error: "Password must contain at least 1 special character");
        }

        // Check for capital letter
        if (!value.contains(RegExp(r'[A-Z]'))) {
          addError(error: "Password must contain at least 1 capital letter");
        } else {
          removeError(error: "Password must contain at least 1 capital letter");
        }

        // Check for number
        if (!value.contains(RegExp(r'[0-9]'))) {
          addError(error: "Password must contain at least 1 number");
        } else {
          removeError(error: "Password must contain at least 1 number");
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter your password");
          isPasswordValid = false;
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          isPasswordValid = false;
          return "";
        } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          addError(error: "Password must contain at least 1 special character");
          isPasswordValid = false;
          return "";
        } else if (!value.contains(RegExp(r'[A-Z]'))) {
          addError(error: "Password must contain at least 1 capital letter");
          isPasswordValid = false;
          return "";
        } else {
          removeError(error: "Please enter your password");
          isPasswordValid = true;
        }
        return null;
      },
    );
  }

  TextFieldInput buildEmailFormField() {
    return TextFieldInput(
      textEditingController: _emailController,
      preIcon: const Icon(Icons.mail),
      labelText: 'Email',
      hintText: 'Email',
      contentPadding: 22,
      textInputType: TextInputType.emailAddress,
      onSaved: (newValue) => _emailController.text = newValue!,
      onChanged: (value) {
        if (value != '') {
          removeError(error: "Please enter your email");
        } else if (!emailRegex.hasMatch(value!)) {
          addError(error: "Please enter a valid email");
        } else {
          removeError(error: "Please enter a valid email");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter your email");
          return "";
        } else if (!emailRegex.hasMatch(value)) {
          addError(error: "Please enter a valid email");
          return "";
        }
        return null;
      },
    );
  }
}
