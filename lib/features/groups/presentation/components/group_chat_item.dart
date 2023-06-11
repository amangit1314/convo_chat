import 'package:flutter/material.dart';

import '../../../../core/components/profile_pic_section.dart';

class GroupChatItem extends StatefulWidget {
  final AssetImage groupDpImg;
  final String groupName;
  final String lastMessage;
  final String personTime;
  final int? messageCount;
  final VoidCallback onTap;

  const GroupChatItem({
    Key? key,
    this.messageCount,
    required this.lastMessage,
    required this.personTime,
    required this.groupDpImg,
    required this.groupName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GroupChatItem> createState() => _GroupChatItemState();
}

class _GroupChatItemState extends State<GroupChatItem> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 8, bottom: 8.0),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            ProfilePicSect(dpImage: widget.groupDpImg, messageCount: 0),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 3),
                  Text(
                    widget.groupName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.lastMessage,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    widget.personTime,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Positioned(
                  right: 5,
                  top: 44,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 12,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
