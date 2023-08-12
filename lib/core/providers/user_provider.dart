import 'package:convo_chat/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthService _authMethods = AuthService();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = (await _authMethods.getUserDetails()) as User;
    _user = user;
    notifyListeners();
  }

  Future registerUser({
    required BuildContext context,
    required String email,
    required String password,
    String? mobile,
  }) async {
    return await _authMethods.registerUser(
      context: context,
      email: email,
      password: password,
      username: email.substring(0, 5),
    );
  }

  Future authenticateUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    return await _authMethods.loginUser(
      context: context,
      email: email,
      password: password,
    );
  }
}
