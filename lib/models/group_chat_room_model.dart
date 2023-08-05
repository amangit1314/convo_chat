import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/message_model.dart';

class GroupModel {
  final String groupId;
  final String groupName;
  final String groupImage;
  final String groupDescription;
  final String createdBy;

  final List<String> members;
  final List<String> admins;
  final List<String> mutedBy;
  final List<MessageModel> messages;

  final Timestamp createdAt;
  final Timestamp updatedAt;
  final int pinnedMessagesCount;

  GroupModel({
    required this.groupId,
    required this.groupName,
    required this.groupImage,
    required this.groupDescription,
    required this.createdBy,
    required this.members,
    required this.admins,
    required this.mutedBy,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.pinnedMessagesCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'groupImage': groupImage,
      'groupDescription': groupDescription,
      'createdBy': createdBy,
      'members': members,
      'admins': admins,
      'mutedBy': mutedBy,
      'messages': messages.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'pinnedMessagesCount': pinnedMessagesCount,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      groupId: map['groupId'] ?? '',
      groupName: map['groupName'] ?? '',
      groupImage: map['groupImage'] ?? '',
      groupDescription: map['groupDescription'] ?? '',
      createdBy: map['createdBy'] ?? '',
      members: List<String>.from(map['members']),
      admins: List<String>.from(map['admins']),
      mutedBy: List<String>.from(map['mutedBy']),
      messages: List<MessageModel>.from(
          map['messages']?.map((x) => MessageModel.fromMap(x))),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      pinnedMessagesCount: map['pinnedMessagesCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(json.decode(source));
}
