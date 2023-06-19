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
        left: sentByMe ? 30 : 12,
        right: sentByMe ? 12 : 30,
      ),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            sentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: sentByMe
                ? const EdgeInsets.only(right: 0)
                : const EdgeInsets.only(left: 5),
            child: Text(
              sender,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            margin: sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: sentByMe ? Radius.zero : const Radius.circular(20),
                bottomRight: sentByMe ? const Radius.circular(20) : Radius.zero,
              ),
              color:
                  sentByMe ? primaryLightColor : primaryColor.withOpacity(.8),
            ),
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: sentByMe ? primaryColor : Colors.white,
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
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
