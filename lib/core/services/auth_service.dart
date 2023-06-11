import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserModel> getUserDetails() async {
    User? currentUser = _auth.currentUser;
    final DocumentSnapshot<Map<String, dynamic>> snap =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return UserModel.fromMap(snap.data()!);
  }

  Future<String> registerUser({
    BuildContext? context,
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
          email: email,
          name: username,
          uid: cred.user!.uid,
          password: password,
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toMap());

        res = 'success';
      } else {
        res = '❗Please enter all the required fields.';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = '❗The email is badly formatted.';
      } else if (err.code == 'weak-password') {
        res = '❗Password should be at least 6 characters long.';
      } else if (err.code == 'email-already-in-use') {
        res = '❗The email is already in use by another account.';
      }
    } catch (err) {
      res = err.toString();
      Get.snackbar(
        'Error Message',
        err.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return res;
  }

  Future<String> loginUser({
    BuildContext? context,
    required String email,
    required String password,
  }) async {
    String res = "❓Error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = '❗Please enter both email and password.';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found' || err.code == 'wrong-password') {
        res = '❗Invalid email or password.';
      }
    } catch (err) {
      res = err.toString();
      Get.snackbar(
        'Error Message',
        err.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return res;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future<void> signInWithOTP(String smsCode, String verId) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar(
        'Error Message',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
