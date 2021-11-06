// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final String avatarImg;
  final String text;

  const StatusItem({Key? key, required this.avatarImg, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(""),
            radius: 50,
          ),
          const SizedBox(height: 5),
          Text(text),
        ],
      ),
    );
  }
}
