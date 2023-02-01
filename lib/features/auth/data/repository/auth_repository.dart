// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/models/user_model.dart';

// final authRepositoryProvider = Provider(
//   (ref) => AuthRepository(
//     auth: FirebaseAuth.instance,
//     firestore: FirebaseFirestore.instance,
//   ),
// );

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  // Future<UserModel?> getCurrentUserData() async {
  //   var userData =
  //       await firestore.collection('users').doc(auth.currentUser?.uid).get();

  //   UserModel? user;
  //   if (userData.data() != null) {
  //     user = UserModel.fromMap(userData.data()!);
  //   }
  //   return user;
  // }

  Future<dynamic> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
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
      Get.showSnackbar(
        GetSnackBar(
          message: e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
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
          // Navigator.pushNamed(
          //   context,
          //   VerifyOtpScreen.routeName,
          //   arguments: verificationId,
          // );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
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

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);

      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   UserInformationScreen.routeName,
      //   (route) => false,
      // );
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

  // void saveUserDataToFirebase({
  //   required String name,
  //   required String email,
  //   required File? profilePic,
  //   required ProviderRef ref,
  //   required BuildContext context,
  //   required String password,
  // }) async {
  //   try {
  //     String uid = auth.currentUser!.uid;
  //     String photoUrl =
  //         'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';
  //     if (profilePic != null) {
  //       photoUrl = await ref
  //           .read(commonFirebaseStorageRepositoryProvider)
  //           .storeFileToFirebase(
  //             'profilePic/$uid',
  //             profilePic,
  //           );
  //     }

  //     var user = UserModel(
  //       email: email,
  //       password: password,
  //       name: name,
  //       uid: uid,
  //       imageUrl: photoUrl,
  //       isOnline: true,
  //       number: auth.currentUser!.phoneNumber!,
  //       groupId: [],
  //     );

  //     await firestore.collection('users').doc(uid).set(user.toJson());

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const NavPage(),
  //       ),
  //       (route) => false,
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  Stream<UserModel> userData(String userId) {
    return firestore.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromJson(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'isOnline': isOnline,
    });
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

  Future<void> loginUser(
      {required BuildContext context,
      required String email,
      required String password}) {
    return auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const NavPage(),
      //   ),
      //   (route) => false,
      // );
    });
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
