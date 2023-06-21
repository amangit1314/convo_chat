import 'package:convo_chat/features/groups/presentation/group_chatting_screen.dart';
import 'package:convo_chat/features/home/data/data.dart';
import 'package:flutter/material.dart';

import 'components/group_chat_item.dart';
import 'create_group_screen.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups';
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            'Groups',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
                size: 24,
              ),
            ),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CreateGroupScreen(
                    imageAssetUrl: 'assets/images/1.jpg',
                  ),
                ),
              )
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ConversationsListView(),
          ],
        ),
      ),
    );
  }
}

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 15),
      child: Flexible(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: conversationsDummyData.length,
          itemBuilder: (context, index) {
            return LocalGroupChatItem(
              index: index,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GroupChattingScreen(
                      imageAssetUrl: conversationsDummyData[index][0],
                      groupName: conversationsDummyData[index][1],
                      groupId: conversationsDummyData[index][5],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

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
