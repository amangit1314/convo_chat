import 'package:flutter/material.dart';

import '../../domain/models/user_model.dart';
import '../repository/auth_repository.dart';

// final authControllerProvider = Provider((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   return AuthController(authRepository: authRepository, ref: ref);
// });

// final userDataAuthProvider = FutureProvider((ref) {
//   final authController = ref.watch(authControllerProvider);
//   return authController.getUserData();
// });

class AuthController {
  final AuthRepository authRepository;
  // final ProviderRef ref;

  AuthController({
    required this.authRepository,
    //required this.ref,
  });

  // Future<UserModel?> getUserData() async {
  //   UserModel? user = await authRepository.getCurrentUserData();
  //   return user;
  // }

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

  // void saveUserDataToFirebase(BuildContext context, String email,
  //     String password, String name, File? profilePic) {
  //   authRepository.saveUserDataToFirebase(
  //     email: email,
  //     password: password,
  //     name: name,
  //     profilePic: profilePic,
  //     //ref: ref,
  //     context: context,
  //   );
  // }

  Stream<UserModel> userDataById(String userId) {
    return authRepository.userData(userId);
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }

  void signOut() {
    authRepository.signOut();
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

  Future<dynamic> loginUser(
      BuildContext context, String email, String password) async {
    return await authRepository.loginUser(
      context: context,
      email: email,
      password: password,
    );
  }

  Future<dynamic> signInWithGoogle(BuildContext context) async {
    return await authRepository.signInWithGoogle(context);
  }
}
