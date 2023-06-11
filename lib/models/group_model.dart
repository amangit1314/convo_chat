import 'dart:convert';

import 'models.dart';

class GroupModel {
  final String groupId;
  final List<UserModel> users;
  final String groupName;
  final String groupImage;
  final List<String> groupAdmins;
  final String groupDescription;

  GroupModel({
    required this.groupId,
    required this.users,
    required this.groupName,
    required this.groupImage,
    required this.groupAdmins,
    required this.groupDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'groupId': groupId,
      'users': users.map((x) => x.toMap()).toList(),
      'groupName': groupName,
      'groupImage': groupImage,
      'groupAdmins': groupAdmins,
      'groupDescription': groupDescription,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      groupId: map['groupId'] ?? '',
      users:
          List<UserModel>.from(map['users']?.map((x) => UserModel.fromMap(x))),
      groupName: map['groupName'] ?? '',
      groupImage: map['groupImage'] ?? '',
      groupAdmins: List<String>.from(map['groupAdmins']),
      groupDescription: map['groupDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(json.decode(source));
}
