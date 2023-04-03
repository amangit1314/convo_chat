import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/constants/firebase_constants.dart';
import '../../domain/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    GoogleSignIn(),
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final GoogleSignIn? _googleSignIn;

  AuthRepository(
    this._googleSignIn, {
    required this.auth,
    required this.firestore,
  });

  CollectionReference get _users =>
      firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => auth.authStateChanges();

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  Future<void> updateUserData(UserModel userModel) async {
    await _users.doc(userModel.id).update(userModel.toMap());
  }

  Stream<UserModel> userData(String userId) {
    return firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  void setUserState(bool isOnline) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({'isOnline': isOnline});
  }

  Future<dynamic> registerUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String fullName}) {
    return auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await firestore.collection('users').doc(value.user!.uid).set({
        'id': value.user!.uid,
        'nickname': fullName,
        'photoUrl': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        'chattingWith': null,
      });

      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   UserInformationScreen.routeName,
      //   (route) => false,
      // );
    });
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final QuerySnapshot result = await firestore
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();

        final List<DocumentSnapshot> documents = result.docs;
        if (documents.isEmpty) {
          firestore.collection('users').doc(user.uid).set({
            'id': user.uid,
            'nickname': user.displayName,
            'photoUrl': user.photoURL,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'chattingWith': null,
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          // Navigator.pushNamed( context, VerifyOtpScreen.routeName, arguments: verificationId);
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) {
    return auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.snackbar(
        'error',
        value.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    });
  }

  Future<void> signOut() async {
    await _googleSignIn!.signOut();
    await auth.signOut();
  }
}
