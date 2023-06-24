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

    // construct chat room id
    List<String> ids = [currentUserUid, receiverId];
    // sort to (ensure that chat room id is always the same for any pair of people)
    ids.sort();
    // combine the ids into single string to use as a chatRoomId
    String chatRoomId = ids.join("_");

    MessageModel newMessage = MessageModel(
      messageType: 'text',
      currentUserEmail,
      chatRoomId: chatRoomId,
      senderId: currentUserUid,
      receiverId: receiverId,
      messageId: 'direct_chat',
      content: message,
      timeStamp: timeStamp,
      userImage: auth.currentUser!.photoURL ?? '',
      userName: auth.currentUser!.email!.split('@')[0],
    );

    // add to database
    await firestore
        .collection("direct_chats")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<List<QueryDocumentSnapshot>> getMessages() {
    String currentUserId = auth.currentUser!.uid;

    return firestore
        .collection("direct_chats")
        .snapshots()
        .asyncMap((snapshot) {
      List<String> chatRoomIds = [];
      for (var doc in snapshot.docs) {
        List<dynamic> participants = doc['members'];
        if (participants.contains(currentUserId)) {
          chatRoomIds.add(doc.id);
        }
      }

      return Future.wait(chatRoomIds.map((chatRoomId) {
        return firestore
            .collection("chat_rooms")
            .doc(chatRoomId)
            .collection('messages')
            .orderBy('timestamp', descending: false)
            .get();
      }));
    }).map((querySnapshots) {
      List<QueryDocumentSnapshot> allMessages = [];
      for (var querySnapshot in querySnapshots) {
        allMessages.addAll(querySnapshot.docs);
      }
      allMessages.sort(
        (a, b) => a['timestamp'].compareTo(b['timestamp']),
      );
      return allMessages;
    });
  }
}
