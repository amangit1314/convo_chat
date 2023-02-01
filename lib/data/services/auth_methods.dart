import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/domain/models/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Getting information from user
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    final DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromMap(snap as Map<String, dynamic>);
  }

  // to register the user
  Future<dynamic> registerUser({
    required String email,
    required String password,
    required String fullName,
  }) async {
    String res = "Some error occured";
    try {
      // ||bio.isNotEmpty ||file != null
      if (email.isNotEmpty || password.isNotEmpty || fullName.isNotEmpty) {
        //  register user using firebase
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (cred.user != null) {
          // DatabaseService(uid: cred.user!.uid)
          //     .updateUserData(fullName: fullName, email: email);
          return true;
        }

        UserModel user = UserModel(
          number: '',
          email: email,
          password: password,
          name: fullName,
          id: cred.user!.uid,
          isOnline: true,
          //groupId: [],
        );

        //  add user to our database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = '❗The email is badly formated...';
      } else if (err.code == 'weak-password') {
        res = 'Password should be 6 characters long...';
      }
    } catch (err) {
      res = res.toString();
      Get.snackbar(
        "error",
        res,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return res;
  }

  // to login the user
  Future<String> loginUser({required email, required password}) async {
    String res = "❓error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = '❗Please enter both email and password';
      }
    } catch (err) {
      res = res.toString();
      Get.snackbar(
        "error",
        res.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return res;
  }
}
