import 'package:flutter/material.dart';

import '../../../../core/components/profile_pic_section.dart';

class ChatItem extends StatefulWidget {
  final AssetImage personDpImg;
  final String personName;
  final String lastMessage;
  final String personTime;
  final int? messageCount;
  final VoidCallback? onTap;
  const ChatItem({
    Key? key,
    this.messageCount,
    required this.personDpImg,
    required this.personName,
    required this.lastMessage,
    required this.personTime,
    this.onTap,
  }) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 8),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            ProfilePicSect(dpImage: widget.personDpImg, messageCount: 0),
            const SizedBox(width: 20),
            // const Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 3),
                  Text(
                    widget.personName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.lastMessage,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            // const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    widget.personTime,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // const Center(
                //   child: Icon(
                //     CupertinoIcons.checkmark_alt_circle,
                //     size: 18,
                //     color: Color.fromARGB(255, 225, 225, 95),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
