import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String? _uid;
  String? _email;
  String? _name;
  String? _photoUrl;

  String? get uid => _uid;
  String? get email => _email;
  String? get name => _name;
  String? get photoUrl => _photoUrl;

  void setUid(String? uid) {
    _uid = uid;
    notifyListeners();
  }

  void setEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  void setName(String? name) {
    _name = name;
    notifyListeners();
  }

  void setPhotoUrl(String? photoUrl) {
    _photoUrl = photoUrl;
    notifyListeners();
  }
}
