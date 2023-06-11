import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/providers/common_firebase_storage_repository_provider.dart';
import '../../../../core/utils/constants/firebase_constants.dart';
import '../../../../models/user_model.dart';

final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanges,
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.watch(commonFirebaseStorageRepositoryProvider),
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;
  final CommonFirebaseStorageRepository commonFirebaseStorageRepository;

  AuthRepository(this.commonFirebaseStorageRepository)
      : auth = FirebaseAuth.instance,
        firestore = FirebaseFirestore.instance,
        googleSignIn = GoogleSignIn();

  CollectionReference get _users =>
      firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChanges => auth.idTokenChanges();

  Future<UserModel?> getCurrentUserData() async {
    final userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;

    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Future updateUserData(UserModel userModel) async {
    await _users.doc(userModel.uid).update(userModel.toMap());
  }

  Stream<UserModel> userData(String userId) {
    return firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  setUserState(bool isOnline) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({'isOnline': isOnline});
  }

  saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required String email,
    String? phoneNumber,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (profilePic != null) {
        photoUrl = await commonFirebaseStorageRepository.storeFileToFirebase(
            'profilePic/$uid', profilePic);
      }

      var user = UserModel(
        name: name,
        uid: uid,
        profilePic: photoUrl,
        isOnline: true,
        number: phoneNumber,
        email: email,
      );

      await firestore.collection('users').doc(uid).set(user.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
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
        return 'success';
      }
      return 'failure';
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      return 'failure';
    }
  }

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (err) {
      log(err.toString());
      return 'failure';
    } catch (err) {
      log(err.toString());
      return 'failure';
    }
  }

  Future<String> signInWithPhone(String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {}),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return 'success';
    } on FirebaseAuthException catch (err) {
      log(err.toString());
      return 'failure';
    } catch (err) {
      log(err.toString());
      return 'failure';
    }
  }

  void verifyOTP({
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log(e.message!);
    }
  }

  Future<String> register({
    required String email,
    required String password,
    required String fullName,
    String? phoneNumber,
    File? profilePic,
  }) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = UserModel(
        email: email,
        password: password,
        name: fullName,
        uid: cred.user!.uid,
        isOnline: true,
      );

      await firestore.collection('users').doc(cred.user!.uid).set(user.toMap());
      log('Success');
      return 'success';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        log('❗The email is badly formatted...');
      } else if (err.code == 'weak-password') {
        log('Password should be 6 characters long...');
      }
      return err.code;
    } catch (err) {
      log(err.toString());
      return err.toString();
    }
  }

  Future signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
