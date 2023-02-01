import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final AssetImage avatarImg;
  final String text;

  const StoryItem({
    Key? key,
    required this.avatarImg,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 34,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 97, 48, 211),
                    Color.fromARGB(255, 211, 48, 205),
                  ],
                ),
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: avatarImg,
                  radius: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
