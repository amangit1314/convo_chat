import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final AssetImage avatarImg;
  final String text;

  const StatusItem({
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
            backgroundImage: avatarImg,
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 10, fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
