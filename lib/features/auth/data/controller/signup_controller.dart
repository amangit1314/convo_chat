import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/models/user_model.dart';
import '../repository/authentication_repository.dart';
import '../repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error =
        AuthenticationRepository.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ) as String?;

    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.number!);
    Get.to(() => const LoginScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
