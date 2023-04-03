import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user_model.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({
    required this.authRepository,
    required this.ref,
  });

  Future<Stream<UserModel>?> getUserData() async {
    Stream<UserModel> user = authRepository.getUserData(
      ref.read(authRepositoryProvider).auth.currentUser!.uid,
    );
    return user;
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }

  Future<dynamic> registerUser(
      BuildContext context, String name, String email, String password) async {
    return await authRepository.registerUser(
      context: context,
      fullName: name,
      email: email,
      password: password,
    );
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  Future<dynamic> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    return await authRepository.signInWithEmailAndPassword(
      context: context,
      email: email,
      password: password,
    );
  }

  Future<dynamic> signInWithGoogle(BuildContext context) async {
    return await authRepository.signInWithGoogle(context);
  }

  void signOut() {
    authRepository.signOut();
  }
}
