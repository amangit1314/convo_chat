import 'package:flutter/material.dart';

import '../../../direct_chat/presentation/direct_chat_screen.dart';
import '../../data/data.dart';
import 'chat_item.dart';

class LocalChatItem extends StatelessWidget {
  final int index;

  const LocalChatItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatItem(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DirectChatScreen(
              imgAssetUrl: conversationsDummyData[index][0],
              username: conversationsDummyData[index][1],
              receiverId: conversationsDummyData[index][5],
              time: conversationsDummyData[index][3],
            ),
          ),
        );
      },
      personDpImg: AssetImage(conversationsDummyData[index][0]),
      personName: conversationsDummyData[index][1],
      lastMessage: conversationsDummyData[index][2],
      personTime: conversationsDummyData[index][3],
    );
  }
}
