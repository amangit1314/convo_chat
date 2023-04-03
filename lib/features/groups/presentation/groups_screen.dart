import 'package:convo_chat/features/home/data/data.dart';
import 'package:flutter/material.dart';

import 'components/group_chat_item.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups';
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Groups',
          style: TextStyle(
              fontSize: 21, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              // style: IconStyle.material,
              onPressed: () => {
                    // this.navigate('AddGroup');
                  }),
        ],
      ),
      body: CustomScrollView(
        // mainAxisSize: MainAxisSize.min,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return LocalGroupChatItem(index: index);
                },
              ),
            ),
          ),
        ],
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
