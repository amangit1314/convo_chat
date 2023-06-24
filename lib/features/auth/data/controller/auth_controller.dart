import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/user_model.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider<UserModel?>((ref) {
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

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }

  Future<String> register(
      String name, String email, String password, String? number) async {
    return await authRepository.register(
      fullName: name,
      email: email,
      password: password,
      phoneNumber: number,
    );
  }

  void signInWithPhone(String phoneNumber) {
    authRepository.signInWithPhone(phoneNumber);
  }

  Future<bool> verifyOTP(String verificationId, String userOTP) async {
    return await authRepository.verifyOTP(
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<dynamic> signInWithGoogle() async {
    return await authRepository.signInWithGoogle();
  }

  void saveUserDataToFirebase({
    required String name,
    required String email,
    File? profilePic,
  }) {
    authRepository.saveUserDataToFirebase(
      name: name,
      email: email,
      profilePic: profilePic,
    );
  }

  Stream<UserModel> userDataById(String userId) {
    return authRepository.userData(userId);
  }

  void signOut() {
    authRepository.signOut();
  }
}
