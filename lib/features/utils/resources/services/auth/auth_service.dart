import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel?> _userFromFirebase(auth.User? user) async {
    if (user == null) {
      return null;
    }

    try {
      final snapshot = await _firestore.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        final userData = snapshot.data();
        if (userData != null) {
          return UserModel(
            uid: user.uid,
            email: user.email!,
            name: userData['name'],
            password: userData['password'],
            profilePic: userData['profilePic'],
            number: userData['number'],
          );
        }
      }
    } catch (e) {
      log('Error retrieving user data: $e');
    }

    return null;
  }
}
