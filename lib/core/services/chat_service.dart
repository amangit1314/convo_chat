import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserUid = _firebaseAuth.currentUser!.uid;
    final Timestamp timeStamp = Timestamp.now();
    MessageModel newMessage = MessageModel(
      '',
      messageId: '',
      messageType: '',
      chatRoomId: '',
      senderId: currentUserUid,
      receiverId: receiverId,
      content: message,
      timeStamp: timeStamp,
      userImage: '',
      userName: '',
    );
    // construct chat room id
    List<String> ids = [currentUserUid, receiverId];
    // sort to (ensure that chat room id is always the same for any pair of people)
    ids.sort();
    // combine the ids into single string to use as a chatRoomId
    String chatRoomId = ids.join("_");
    // add to database
    await _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct chat room id
    List<String> ids = [userId, otherUserId];
    // sort to (ensure that chat room id is always the same for any pair of people)
    ids.sort();
    // combine the ids into single string to use as a chatRoomId
    String chatRoomId = ids.join("_");
    return _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void receiveMessage() {}
  void deleteMessage() {}
}
