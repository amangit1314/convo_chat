import 'package:convo_chat/components/chat_item.dart';
import 'package:flutter/material.dart';

class AnotherScrollView extends StatelessWidget {
  const AnotherScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> content = {
      'assets/images/1.jpg': '1',
      'assets/images/2.jpg': '1',
      'assets/images/3.jpg': '1',
      'assets/images/4.jpg': '1',
      'assets/images/5.jpg': '1',
      'assets/images/6.jpg': '1',
      'assets/images/7.jpg': '1',
      'assets/images/8.jpg': '1',
      'assets/images/9.jpg': '1',
      'assets/images/10.jpg': '1',
      'assets/images/11.jpg': '1',
      'assets/images/12.jpg': '1',
      'assets/images/13.jpg': '1',
      'assets/images/14.jpg': '1',
      'assets/images/15.jpg': '1',
    };

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return const LocalChatItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LocalChatItem extends StatelessWidget {
  const LocalChatItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatItem(
      lastMessage: "Hi Myself Rohit!",
      personDpImg: AssetImage('assets/images/7.jpg'),
      personName: "Rohit Saini",
      personTime: "10:45 am",
    );
  }
}
