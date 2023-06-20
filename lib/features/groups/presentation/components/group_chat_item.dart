import 'package:flutter/material.dart';

import '../../../../core/components/profile_pic_section.dart';
import '../../../../core/utils/theme/colors.dart';

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
        height: 85,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            ProfilePicSect(dpImage: widget.groupDpImg, messageCount: 0),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.groupName,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                      ),
                      Text(
                        widget.personTime,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: primaryColor,
                              fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Text(
                          widget.lastMessage,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: primaryColor.withOpacity(.7)),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 44,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                          child: Center(
                            child: Text(
                              '0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }
}
