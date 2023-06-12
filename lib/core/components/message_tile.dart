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
      alignment: sentByMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment:
            sentByMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if (!sentByMe) ...[
            Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: Text(
                sender,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
          Container(
            margin: sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: sentByMe ? const Radius.circular(20) : Radius.zero,
                bottomRight: sentByMe ? Radius.zero : const Radius.circular(20),
              ),
              color:
                  sentByMe ? Theme.of(context).primaryColor : primaryLightColor,
            ),
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: sentByMe ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.only(left: 20, right: 20),
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
