import 'package:convo_chat/screens/chat/video/video_calls_sceen.dart';
import 'package:flutter/material.dart';

import 'package:convo_chat/screens/chat/group_chat_screen.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff617CDC),
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 28.0, right: 28.0, top: 46.0, bottom: 10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/2.jpg'),
                    radius: 60,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Aman Soni",
                    style: TextStyle(
                      color: Color(0xFFEEEFF1),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.group),
                    title: Text(
                      'Groups',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(const GroupChatScreen());
                  },
                ),
                GestureDetector(
                    child: const ListTile(
                      leading: Icon(Icons.call_outlined),
                      title: Text(
                        'Calls',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(const VideoCallsScreen());
                    }),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 110),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
