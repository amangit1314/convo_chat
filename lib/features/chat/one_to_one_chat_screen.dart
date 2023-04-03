import 'package:convo_chat/core/components/message_tile.dart';
import 'package:convo_chat/features/nav/presentation/bottom_nav.dart';
import 'package:flutter/material.dart';

import '../home/data/data.dart';

class OneToOneChatScreen extends StatefulWidget {
  const OneToOneChatScreen({super.key});

  @override
  State<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends State<OneToOneChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: TopChatBar(),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: const [
            ChatMessagesList(),
            BottomMessageInputBar(),
          ],
        ),
      ),
    );
  }
}

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: conversationsDummyData.length,
        itemBuilder: ((context, index) {
          return MessageTile(
            message: conversationsDummyData[index][2],
            sender: conversationsDummyData[index][1],
            sentByMe: conversationsDummyData[index][4],
            msgTime: conversationsDummyData[index][3],
          );
        }),
      ),
    );
  }
}

class BottomMessageInputBar extends StatelessWidget {
  const BottomMessageInputBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic),
          ),
        ],
      ),
    );
  }
}

class TopChatBar extends StatelessWidget {
  const TopChatBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flexible(
        child: Material(
          elevation: 0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/1.jpg'),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Active 2h ago',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.videocam),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
