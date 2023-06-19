import 'package:convo_chat/features/calls/calls_screen.dart';
import 'package:flutter/material.dart';

import '../../groups/presentation/groups_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/profile.dart';

List<Widget> pages = const [
  HomeScreen(),
  GroupsScreen(),
  CallsScreen(),
  Profile(email: '', userName: ''),
];
