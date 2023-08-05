import 'package:convo_chat/core/utils/theme/colors.dart';
import 'package:convo_chat/features/auth/presentation/register/components/body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/registerScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryLightColor,
      body: Body(),
    );
  }
}
