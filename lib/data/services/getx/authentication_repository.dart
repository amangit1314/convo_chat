//import 'package:convo_chat/features/nav/presentation/nav_page.dart';
import 'package:convo_chat/features/home/presentation/home_screen.dart';
import 'package:convo_chat/features/onboard/presentation/onboard_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    (user == null)
        ? Get.offAll(() => const Onboard1Screen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
    } catch (err) {
      Get.snackbar(
        'Error',
        err.toString(),
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loginWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
    } catch (err) {
      Get.snackbar(
        'Error',
        err.toString(),
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> phoneAuthentication(String phoneNo) {
    return _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
            'Error',
            'The provided phone number is not valid.',
            colorText: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String? smsCode = 'xxxx';
        // Update the UI - wait for the user to enter the SMS code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> logout() async => await _auth.signOut();
}
