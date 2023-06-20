import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;
  // final String chatRoom;
  // final String chatRoomId;

  MessageModel(
    this.senderEmail, {
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
    // required this.chatRoom,
    // required this.chatRoomId,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderEmail': senderEmail,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timeStamp': timeStamp,
      // 'chatRoom': chatRoom,
      // 'chatRoomId': chatRoomId,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      map['senderEmail'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      message: map['message'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      // chatRoom: map['chatRoom'] ?? '',
      // chatRoomId: map['chatRoomId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
