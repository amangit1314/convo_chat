import 'package:flutter/material.dart';

import '../../../core/components/chat_item.dart';
import '../data.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: content.length,
        itemBuilder: (context, index) {
          return LocalChatItem(index: index);
        },
      ),
    );
  }
}

class LocalChatItem extends StatelessWidget {
  final int index;
  const LocalChatItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatItem(
      personDpImg: AssetImage(content[index][0]),
      personName: content[index][1],
      lastMessage: content[index][2],
      personTime: content[index][3],
    );
  }
}
