import 'package:flutter/material.dart';

import '../../../chat/presentation/one_to_one_chat_screen.dart';
import '../../data/data.dart';
import 'chat_item.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
      child: Flexible(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: conversationsDummyData.length,
          itemBuilder: (context, index) {
            return LocalChatItem(index: index);
          },
        ),
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
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OneToOneChatScreen(
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
