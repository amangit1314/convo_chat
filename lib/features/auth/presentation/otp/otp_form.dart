import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpForm extends ConsumerWidget {
  final String verificationId;
  final Function(String) onOTPVerified;

  const OtpForm({
    required this.verificationId,
    required this.onOTPVerified,
    Key? key,
  }) : super(key: key);

  void verifyOtp(WidgetRef ref, BuildContext context, String otp) async {
    final authController = ref.read(authControllerProvider);
    bool isOTPValid = await authController.verifyOTP(verificationId, otp);

    if (isOTPValid) {
      onOTPVerified(otp);
    } else {
      // Show an error message or perform any other action
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 6; i++)
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: '-',
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: const Color.fromARGB(255, 99, 99, 99)
                              .withOpacity(.7),
                        ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && i < 5) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.length == 6) {
                      verifyOtp(ref, context, value);
                      FocusScope.of(context).unfocus();
                    }
                  },
                  onSaved: (value) {
                    if (value != null && value.length == 6) {
                      verifyOtp(ref, context, value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
