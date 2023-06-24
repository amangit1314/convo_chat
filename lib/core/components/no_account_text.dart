import 'package:convo_chat/features/auth/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/theme/colors.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72.0),
      child: Row(
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => const RegisterScreen()),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 12,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
