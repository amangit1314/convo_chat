import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:flutter/material.dart';

import '../../groups/presentation/groups_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/profile.dart';

List<Widget> pages = const [
  HomeScreen(),
  GroupsScreen(),
  // CallsScreen(),
  // Scaffold(
  //   backgroundColor: Colors.redAccent,
  //   body: Center(
  //       child: Text(
  //     'Calls',
  //     style: TextStyle(color: Colors.white, fontSize: 18),
  //   )),
  // ),
  CallsScreen(),
  Profile(email: '', userName: ''),
  // Scaffold(
  //   backgroundColor: Colors.blueAccent,
  //   body: Center(
  //       child: Text(
  //     'Profile',
  //     style: TextStyle(color: Colors.white, fontSize: 18),
  //   )),
  // )
  // Profile(email: '', userName: ''),
];
