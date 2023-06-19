import 'package:convo_chat/core/components/message_tile.dart';
import 'package:convo_chat/features/nav/presentation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/theme/colors.dart';
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
      backgroundColor: primaryLightColor.withOpacity(.97),
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
  const BottomMessageInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message ...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: primaryColor.withOpacity(.7)),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.link),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: PopupMenuButton<int>(
            //     icon: const FaIcon(
            //       FontAwesomeIcons.sortDown,
            //       color: Colors.black,
            //       size: 20,
            //     ),
            //     splashRadius: 20,
            //     itemBuilder: (context) => [
            //       PopupMenuItem(
            //           child: IconButton(
            //             onPressed: () {},
            //             icon: const Icon(Icons.camera_alt),
            //           ),
            //           onTap: () {}),
            //       PopupMenuItem(
            //           child: IconButton(
            //             onPressed: () {},
            //             icon: const Icon(Icons.mic),
            //           ),
            //           onTap: () {}),
            //     ],
            //   ),
            // ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class TopChatBar extends StatelessWidget {
  const TopChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flexible(
        child: Material(
          elevation: 0,
          color: primaryLightColor,
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
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Active 2h ago',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: primaryColor.withOpacity(.7)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.video,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.mobileRetro,
                  size: 24,
                ),
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
