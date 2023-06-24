import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/components/message_tile.dart';
import '../../../direct_chat/data/controller/chat_controller.dart';
import '../../../home/data/data.dart';

class GroupMessagesList extends ConsumerWidget {
  final String groupId;

  const GroupMessagesList({required this.groupId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.watch(chatControllerProvider);

    return Flexible(
      child: StreamBuilder(
        stream: chatController.getMessages(),
        builder: (context, snapshot) {
          // if (snapshot.hasError) {
          //   return Text("Error: ${snapshot.error}");
          // }

          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          // // final messages = snapshot.data?.docs;

          // if (messages == null || messages.isEmpty) {
          //   return const Center(child: Text('No messages yet.'));
          // }

          return ListView.builder(
            // itemCount: messages.length,
            itemCount: conversationsDummyData.length,
            reverse: true,
            itemBuilder: (context, index) {
              // final message = messages[index].data();
              // return MessageTile(
              //   message: message['message'],
              //   sender: message['senderEmail'].split('@')[0],
              //   sentByMe: message['senderId'] ==
              //       FirebaseAuth.instance.currentUser!.uid,
              //   msgTime: message['timestamp'].toString(),
              // );
              return MessageTile(
                message: conversationsDummyData[index][2],
                sender: conversationsDummyData[index][1],
                sentByMe: conversationsDummyData[index][4],
                msgTime: conversationsDummyData[index][3],
              );
            },
          );
        },
      ),
    );
  }
}
