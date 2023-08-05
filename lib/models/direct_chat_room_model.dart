import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/message_model.dart';

class DirectChatRoomModel {
  final String roomId;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  final List<String> members;
  final List<MessageModel> messages;

  DirectChatRoomModel({
    required this.roomId,
    required this.createdAt,
    required this.updatedAt,
    required this.members,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomId': roomId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'members': members,
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory DirectChatRoomModel.fromMap(Map<String, dynamic> map) {
    return DirectChatRoomModel(
      roomId: map['roomId'] ?? '',
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      members: List<String>.from(map['members']),
      messages: List<MessageModel>.from(
        map['messages']?.map(
          (x) => MessageModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectChatRoomModel.fromJson(String source) =>
      DirectChatRoomModel.fromMap(json.decode(source));
}
