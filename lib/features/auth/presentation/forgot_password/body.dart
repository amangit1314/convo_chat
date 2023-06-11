// create forgot password screen body for ui

import 'package:flutter/material.dart';

import '../../../../core/components/text_field_input.dart';
import '../components/auth_button.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Please enter your email address. You will receive a link to create a new password via email.',
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        TextFieldInput(
          labelText: 'Email',
          textInputType: TextInputType.emailAddress,
          textEditingController: _emailController,
          hintText: 'Enter Email',
          preIcon: const Icon(Icons.email_outlined),
        ),
        const SizedBox(height: 20),
        AuthButton(
          name: 'Send',
          onTap: () {},
        ),
        const Spacer(),
        AuthButton(
          bgColor: Colors.white,
          textColor: const Color(0xff2D2B2B),
          borderColor: const Color(0xff2D2B2B),
          borderWidth: 1.2,
          onTap: () {
            Navigator.pop(context);
          },
          name: 'Back to Login',
        ),
        const Spacer(),
      ],
    );
  }
}
