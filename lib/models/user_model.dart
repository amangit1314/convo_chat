import 'dart:convert';

import 'models.dart';

class UserModel {
  final String uid;
  final String? name;
  final String email;
  final String? token;
  final String? bio;
  final String? password;
  final String? number;
  final bool? isOnline;
  final String? profilePic;
  final List<GroupModel>? joinedGroups;
  final List<DirectChatRoomModel>? chats;

  UserModel({
    required this.uid,
    this.name,
    required this.email,
    this.password,
    this.token,
    this.number,
    this.isOnline,
    this.joinedGroups,
    this.profilePic,
    this.bio,
    this.chats,
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
      'joinedGroups': joinedGroups?.map((group) => group.toMap()).toList(),
      'profilePic': profilePic,
      'bio': bio,
      'chats': chats,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'] ?? 'Convo User',
      email: map['email'],
      token: map['token'],
      number: map['number'] ?? '',
      isOnline: map['isOnline'] ?? false,
      password: map['password'] ?? '12345678',
      joinedGroups: List<GroupModel>.from(map['joinedGroups'] ?? []),
      profilePic: map['profilePic'],
      bio: map['bio'] ?? '',
      chats: map['chats'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
