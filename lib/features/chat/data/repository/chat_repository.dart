import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../models/message_model.dart';

final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ChatRepository(),
);

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ChatRepository()
      : auth = FirebaseAuth.instance,
        firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserUid = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      currentUserEmail,
      senderId: currentUserUid,
      receiverId: receiverId,
      message: message,
      timeStamp: timeStamp,
    );

    // construct chat room id
    List<String> ids = [currentUserUid, receiverId];
    // sort to (ensure that chat room id is always the same for any pair of people)
    ids.sort();
    // combine the ids into single string to use as a chatRoomId
    String chatRoomId = ids.join("_");

    // add to database
    await firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String otherUserId) {
    // construct chat room id
    List<String> ids = [auth.currentUser!.uid, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
