import 'package:convo_chat/features/home/data/data.dart';
import 'package:flutter/material.dart';

import 'components/group_chat_item.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Groups',
          style: TextStyle(fontSize: 21, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              itemCount: conversationsDummyData.length,
              itemBuilder: ((context, index) {
                return LocalGroupChatItem(index: index);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class LocalGroupChatItem extends StatelessWidget {
  final int index;
  const LocalGroupChatItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupChatItem(
      onTap: () {},
      groupDpImg: AssetImage(conversationsDummyData[index][0]),
      groupName: conversationsDummyData[index][1],
      lastMessage: conversationsDummyData[index][2],
      personTime: conversationsDummyData[index][3],
    );
  }
}
