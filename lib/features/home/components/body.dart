import 'package:convo_chat/features/home/components/stories_view.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import 'messages_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(width: 15),
                    Text(
                      'Stories',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const StoriesView(),
                Row(
                  children: const [
                    SizedBox(width: 15),
                    Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < content.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: LocalChatItem(index: i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
