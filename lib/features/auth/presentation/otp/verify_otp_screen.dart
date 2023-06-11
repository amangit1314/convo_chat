import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/controller/auth_controller.dart';

class VerifyOtpScreen extends ConsumerWidget {
  final String verificationId;
  static const routeName = '/verifyOtp';
  const VerifyOtpScreen({Key? key, required this.verificationId})
      : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read<AuthController>(authControllerProvider).verifyOTP(
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Verification Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'We have sent the code verification to your entered number',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Resend code after seconds: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '60',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 77, 21, 21),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '- - - - - -',
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 6) {
                      // verifyOTP(ref, context, val.trim());
                    }
                  },
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Want to change the number?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Get OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 77, 21, 21),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 77, 21, 21)
                          .withOpacity(0.7),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Resend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 77, 21, 21),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}