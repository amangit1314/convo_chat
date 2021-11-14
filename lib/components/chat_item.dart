import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatItem extends StatelessWidget {
  final AssetImage personDpImg;
  final String personName;
  final String lastMessage;
  final String personTime;
  //final OnTap onTap;
  const ChatItem({
    Key? key,
    required this.lastMessage,
    required this.personDpImg,
    required this.personName,
    required this.personTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: personDpImg,
              radius: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 3),
                  Text(
                    personName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lastMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            Column(
              children: [
                Text(
                  personTime,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                const Icon(
                  Icons.done_all_rounded,
                  size: 18,
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
