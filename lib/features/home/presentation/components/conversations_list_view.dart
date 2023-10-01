import 'package:flutter/material.dart';

import '../../data/data.dart';

import 'local_chat_item.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: conversationsDummyData.length,
        itemBuilder: (context, index) {
          return LocalChatItem(index: index);
        },
      ),
    );
  }
}
