import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? firebaseUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithPhoneNumber(
      String smsCode, String verificationId) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return user;
  }

  Future<void> loginWithNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        onVerificationCompleted(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        codeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        codeAutoRetrievalTimeout(verificationId);
      },
    );
  }
}
