import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_chat/core/components/message_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/controller/chat_controller.dart';

class ChatMessagesList extends ConsumerWidget {
  final String receiverId;

  const ChatMessagesList({required this.receiverId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: StreamBuilder<QuerySnapshot>(
        stream: ref
            .read<ChatController>(chatControllerProvider)
            .getMessages(receiverId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final messages = snapshot.data?.docs;

          if (messages == null || messages.isEmpty) {
            return const Center(child: Text('No messages yet.'));
          }

          return ListView.builder(
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return MessageTile(
                message: messages[index]['message'],
                sender: messages[index]['senderEmail'].split('@')[0],
                sentByMe: messages[index]['senderId'] ==
                    FirebaseAuth.instance.currentUser!.uid,
                msgTime: messages[index]['timestamp'].toString(),
              );
            },
          );
        },
      ),
    );
  }
}


// return ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   // itemCount: conversationsDummyData.length,
          //   itemBuilder: ((context, index) {
          //     return MessageTile(
          //       // message: conversationsDummyData[index][2],
          //       // sender: conversationsDummyData[index][1],
          //       // sentByMe: conversationsDummyData[index][4],
          //       // msgTime: conversationsDummyData[index][3],
          //     );
          //   }),
          // );