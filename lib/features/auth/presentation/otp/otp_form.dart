import 'package:convo_chat/features/auth/data/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpForm extends ConsumerWidget {
  final String verificationId;
  const OtpForm(this.verificationId, {super.key});

  void verifyOtp(WidgetRef ref, BuildContext context, String otp) {
    ref
        .read<AuthController>(authControllerProvider)
        .verifyOTP(verificationId, otp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: '- - - - - -',
                hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:
                          const Color.fromARGB(255, 99, 99, 99).withOpacity(.7),
                    ),
              ),
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOtp(ref, context, value);
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin) {
                verifyOtp(ref, context, pin!);
              },
              keyboardType: TextInputType.number,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.center,
            ),
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 77, 21, 21),
          //     borderRadius: BorderRadius.all(Radius.circular(12)),
          //   ),
          //   height: 68,
          //   width: 64,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       enabledBorder: InputBorder.none,
          //       errorBorder: InputBorder.none,
          //       disabledBorder: InputBorder.none,
          //       hintText: '0',
          //       hintStyle: Theme.of(context)
          //           .textTheme
          //           .headline6!
          //           .copyWith(color: Colors.grey),
          //     ),
          //     onChanged: (value) {
          //       if (value.length == 1) {
          //         verifyOtp(ref, context, value.trim());
          //         FocusScope.of(context).nextFocus();
          //       }
          //     },
          //     onSaved: (pin2) {
          //       verifyOtp(ref, context, pin2!);
          //     },
          //     keyboardType: TextInputType.number,
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline6!
          //         .copyWith(color: Colors.white),
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(1),
          //       FilteringTextInputFormatter.digitsOnly,
          //     ],
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 77, 21, 21),
          //     borderRadius: BorderRadius.all(Radius.circular(12)),
          //   ),
          //   height: 68,
          //   width: 64,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       enabledBorder: InputBorder.none,
          //       errorBorder: InputBorder.none,
          //       disabledBorder: InputBorder.none,
          //       hintText: '0',
          //       hintStyle: Theme.of(context)
          //           .textTheme
          //           .headline6!
          //           .copyWith(color: Colors.grey),
          //     ),
          //     onChanged: (value) {
          //       if (value.length == 1) {
          //         verifyOtp(ref, context, value.trim());
          //         FocusScope.of(context).nextFocus();
          //       }
          //     },
          //     onSaved: (pin3) {
          //       verifyOtp(ref, context, pin3!);
          //     },
          //     keyboardType: TextInputType.number,
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline6!
          //         .copyWith(color: Colors.white),
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(1),
          //       FilteringTextInputFormatter.digitsOnly,
          //     ],
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 77, 21, 21),
          //     borderRadius: BorderRadius.all(Radius.circular(12)),
          //   ),
          //   height: 68,
          //   width: 64,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       enabledBorder: InputBorder.none,
          //       errorBorder: InputBorder.none,
          //       disabledBorder: InputBorder.none,
          //       hintText: '0',
          //       hintStyle: Theme.of(context)
          //           .textTheme
          //           .headline6!
          //           .copyWith(color: Colors.grey),
          //     ),
          //     onChanged: (value) {
          //       if (value.length == 1) {
          //         verifyOtp(ref, context, value.trim());
          //         FocusScope.of(context).nextFocus();
          //       }
          //     },
          //     onSaved: (pin4) {
          //       verifyOtp(ref, context, pin4!);
          //     },
          //     keyboardType: TextInputType.number,
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline6!
          //         .copyWith(color: Colors.white),
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(1),
          //       FilteringTextInputFormatter.digitsOnly,
          //     ],
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
    );
  }
}
