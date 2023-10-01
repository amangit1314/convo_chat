import 'package:flutter/material.dart';

import '../../../home/data/data.dart';
import '../group_chat_screen.dart';
import 'local_Group_chat_item.dart';

class GroupConversationsListView extends StatelessWidget {
  const GroupConversationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 15),
      child: Column(
        children: [
          Flexible(
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
        ],
      ),
    );
  }
}
