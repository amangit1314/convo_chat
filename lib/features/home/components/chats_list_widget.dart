import 'package:flutter/material.dart';

import '../../../core/components/chat_item.dart';
import '../data.dart';

class ChatsListWidget extends StatelessWidget {
//ConsumerWidget {
  const ChatsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //, WidgetRef ref) {
    // return StreamBuilder<List<ChatContact>>(
    //   stream: ref.read(chatRepositoryProvider).getChatContacts(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingWidget();
    //     }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: content.length,
      itemBuilder: (context, index) {
        //var chatItemData = snapshot.data![index];
        // return ChatItem(
        //   personDpImg: AssetImage(chatItemData.profilePic),
        //   personName: chatItemData.name,
        //   personTime: DateFormat.Hm().format(chatItemData.timeSent),
        //   lastMessage: chatItemData.lastMessage,
        //   messageCount: chatItemData.unreadMessages,
        // );
        return ChatItem(
          personDpImg: AssetImage(content[index][0]),
          personName: content[index][1],
          lastMessage: content[index][2],
          personTime: content[index][3],
        );
      },
    );
    // return CustomScrollView(
    //   slivers: [
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         childCount: 20,
    //         (BuildContext context, int index) {
    //           return ChatItem(
    //             lastMessage: 'lastMessage',
    //             personDpImg: AssetImage(content[2]),
    //             personName: '',
    //             personTime: '',
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
    //},
    //);
  }
}
