import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/core/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/auth/domain/models/user_model.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  // Getting information from user
  Future<UserModel> getUserDetails() async {
    User currentUser = auth.currentUser!;
    final DocumentSnapshot snap =
        await firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromMap(snap as Map<String, dynamic>);
  }

  // to register the user
  Future<void> registerUser({
    required BuildContext context,
    required String email,
    required String password,
    String? fullName,
    String? number,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
          number: number,
          email: email,
          password: password,
          name: fullName,
          id: cred.user!.uid,
          isOnline: true,
        );

        //  add user to our database
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        // res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        // res = '❗The email is badly formated...';
      } else if (err.code == 'weak-password') {
        res = 'Password should be 6 characters long...';
      }
    } catch (err) {
      res = res.toString();
      showErrorSnackBar(context, err.toString());
    }
    // return res;
  }

  // to login the user
  Future<void> loginUser({
    required BuildContext context,
    required email,
    required password,
  }) async {
    String res = "❓error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      } else {
        res = '❗Please enter both email and password';
      }
    } catch (err) {
      res = res.toString();
      showErrorSnackBar(context, err.toString());
    }
    // return res;
  }

  // to signout the use
  Future<void> signOut() async {
    await auth.signOut();
  }
}
