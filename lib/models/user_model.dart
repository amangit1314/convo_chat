import 'dart:convert';

import 'models.dart';

class UserModel {
  final String uid;
  final String? name;
  final String email;
  final String? token;
  final String? password;
  final String? number;
  final bool? isOnline;
  final List<GroupModel>? addedGroups;
  final String? profilePic;
  final String? bio;

  UserModel({
    required this.uid,
    this.name,
    required this.email,
    this.password,
    this.token,
    this.number,
    this.isOnline,
    this.addedGroups,
    this.profilePic,
    this.bio,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'token': token,
      'number': number,
      'isOnline': isOnline,
      'password': password,
      'addedGroups': addedGroups?.map((group) => group.toMap()).toList(),
      'profilePic': profilePic,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'] ?? '',
      token: map['token'],
      number: map['number'],
      isOnline: map['isOnline'],
      password: map['password'],
      addedGroups: List<GroupModel>.from(map['addedGroups'] ?? []),
      profilePic: map['profilePic'],
      bio: map['bio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
