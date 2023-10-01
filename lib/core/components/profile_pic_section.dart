import 'package:flutter/material.dart';

class ProfilePicSect extends StatelessWidget {
  const ProfilePicSect({
    Key? key,
    required this.dpImage,
    required this.messageCount,
  }) : super(key: key);

  //final dynamic widget;
  final int messageCount;
  final AssetImage dpImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 32,
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
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: dpImage,
                radius: 28,
              ),
            ),
          ),
        ),
        messageCount != 0
            ? Positioned(
                right: 5,
                top: 44,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 12,
                  child: Center(
                    child: Text(
                      '$messageCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
