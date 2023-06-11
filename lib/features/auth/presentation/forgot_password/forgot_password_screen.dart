// create an user interface for forgot password screen
import 'package:flutter/material.dart';

import 'body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: const ForgotPasswordBody(),
    );
  }
}
