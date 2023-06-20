import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final String msgTime;

  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.sentByMe,
    required this.msgTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 4,
        left: sentByMe ? 12 : 20,
        right: sentByMe ? 20 : 12,
      ),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            sentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: sentByMe
                ? const EdgeInsets.only(right: 5)
                : const EdgeInsets.only(left: 0),
            child: Text(
              sender,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: sentByMe
                    ? Colors.indigoAccent.shade400.withOpacity(.8)
                    : primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            margin: sentByMe
                ? const EdgeInsets.only(left: 20)
                : const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: sentByMe ? const Radius.circular(20) : Radius.zero,
                bottomRight: sentByMe ? Radius.zero : const Radius.circular(20),
              ),
              color: sentByMe
                  ? Colors.indigoAccent.shade400.withOpacity(.8)
                  : Colors.grey.shade100.withOpacity(.5),
            ),
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: sentByMe ? Colors.white : primaryColor,
                    fontSize: 12,
                  ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: sentByMe
                ? const EdgeInsets.only(right: 0)
                : const EdgeInsets.only(left: 5),
            child: Text(
              msgTime,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 10, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
