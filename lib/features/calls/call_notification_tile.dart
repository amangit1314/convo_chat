import 'package:convo_chat/features/calls/call_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CallNotificationTile extends StatelessWidget {
  final String img;
  final String name;
  final String time;
  final String? count;
  final FaIcon? callIcon;
  const CallNotificationTile({
    super.key,
    required this.img,
    required this.name,
    required this.time,
    this.count,
    this.callIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Flexible(
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //color: const Color.fromARGB(255, 110, 43, 244).withOpacity(.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                          backgroundImage: AssetImage(img),
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.arrowDown19,
                          color: Colors.green,
                          size: 14,
                        ),
                        Text(
                          time,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              callIcon!,
            ],
          ),
        ),
      ),
      onTap: () {
        Get.to(() => const CallInfoScreen());
      },
    );
  }
}
