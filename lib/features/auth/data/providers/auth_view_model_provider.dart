import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModeProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  String _email = '';
  String get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  String? emailValidae(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }
}
