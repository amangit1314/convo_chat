import 'package:convo_chat/features/home/data/data.dart';
import 'package:flutter/material.dart';

import 'group_chat_item.dart';

class LocalGroupChatItem extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  const LocalGroupChatItem({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupChatItem(
      onTap: onTap,
      groupDpImg: AssetImage(conversationsDummyData[index][0]),
      groupName: conversationsDummyData[index][1],
      lastMessage: conversationsDummyData[index][2],
      personTime: conversationsDummyData[index][3],
    );
  }
}
