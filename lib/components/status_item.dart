import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  late final String avatarImg;
  late final String text;

  // ignore: non_constant_identifier_names
  StatusItem({Key? key, required this.avatarImg, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage
              avatarImg,
            ),
          ),
          SizedBox(height: 5),
          Text(text),
        ],
      ),
    );
  }
}
