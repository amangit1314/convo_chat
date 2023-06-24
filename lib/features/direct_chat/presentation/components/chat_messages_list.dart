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
    final chatController = ref.watch(chatControllerProvider);

    return Flexible(
      child: StreamBuilder(
        stream: chatController.getMessages(),
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
              final message = messages[index].data();
              return MessageTile(
                message: message['message'],
                sender: message['senderEmail'].split('@')[0],
                sentByMe: message['senderId'] ==
                    FirebaseAuth.instance.currentUser!.uid,
                msgTime: message['timestamp'].toString(),
              );
            },
          );
        },
      ),
    );
  }
}
