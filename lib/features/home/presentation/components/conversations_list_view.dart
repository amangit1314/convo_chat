import 'package:flutter/material.dart';

import '../../../chat/one_to_one_chat_screen.dart';
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
          // scrollDirection: Axis.vertical,
          itemCount: conversationsDummyData.length,
          itemBuilder: (context, index) {
            return LocalChatItem(
              index: index,
            );
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
            builder: (context) => const OneToOneChatScreen(),
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
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: conversationsDummyData.length,
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
            personDpImg: AssetImage(conversationsDummyData[index][0]),
            personName: conversationsDummyData[index][1],
            lastMessage: conversationsDummyData[index][2],
            personTime: conversationsDummyData[index][3],
          );
        },
      ),
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
