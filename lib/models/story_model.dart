import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/message_model.dart';

class StoryModel {
  final String storyId;
  final String uid;
  final String title;
  final String previewImage;

  final List<Map<String, String>> content;
  final Timestamp postedAt;

  final String? captions;
  final String? mentions;
  final List<String>? reactions;
  final List<MessageModel>? comments;

  StoryModel({
    required this.storyId,
    required this.uid,
    required this.title,
    required this.previewImage,
    required this.content,
    required this.postedAt,
    this.captions,
    this.mentions,
    this.reactions,
    this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'storyId': storyId,
      'uid': uid,
      'title': title,
      'previewImage': previewImage,
      'content': content,
      'postedAt': postedAt,
      'captions': captions,
      'mentions': mentions,
      'reactions': reactions,
      'comments': comments,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      storyId: map['storyId'] ?? '',
      uid: map['uid'] ?? '',
      title: map['title'] ?? '',
      previewImage: map['previewImage'] ?? '',
      content: List<Map<String, String>>.from(
          map['content']?.map((x) => Map<String, String>)),
      postedAt: map['postedAt'],
      captions: map['captions'],
      mentions: map['mentions'],
      reactions: List<String>.from(map['reactions']),
      comments: List<MessageModel>.from(map['comments']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));
}
