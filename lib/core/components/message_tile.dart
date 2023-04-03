import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final String msgTime;

  const MessageTile(
      {Key? key,
      required this.message,
      required this.sender,
      required this.sentByMe,
      required this.msgTime})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 4,
        left: widget.sentByMe ? 30 : 12,
        right: widget.sentByMe ? 12 : 30,
      ),
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            widget.sentByMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            margin: widget.sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              widget.sender,
              textAlign: widget.sentByMe ? TextAlign.end : TextAlign.start,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: widget.sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.only(
              top: 17,
              bottom: 17,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: widget.sentByMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
              color: widget.sentByMe
                  ? Theme.of(context).primaryColor
                  : Colors.deepOrange.withOpacity(.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.sentByMe ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: widget.sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.only(
              // top: 17,
              // bottom: 17,
              left: 20,
              right: 20,
            ),
            child: Text(
              widget.msgTime,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
