import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String chatRoomId;
  final String content;
  final String messageType;
  final String reaction;
  final Timestamp timeStamp;
  final String userName;
  final String userImage;

  MessageModel(
    this.reaction, {
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.chatRoomId,
    required this.content,
    required this.messageType,
    required this.timeStamp,
    required this.userImage,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'chatRoomId': chatRoomId,
      'message': content,
      'messageType': messageType,
      'timeStamp': timeStamp,
      'reaction': reaction,
      'userImage': userImage,
      'userName': userName,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      map['reaction'] ?? '',
      messageId: map['senderEmail'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      chatRoomId: map['chatRoomId'] ?? '',
      content: map['content'] ?? '',
      messageType: map['messageType'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      userImage: map['userImage'] ?? '',
      userName: map['userName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
