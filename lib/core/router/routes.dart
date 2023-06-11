import 'package:convo_chat/features/groups/presentation/groups_screen.dart';
import 'package:convo_chat/features/nav/presentation/bottom_nav.dart';
import 'package:convo_chat/features/onboard/presentation/onboard_1.dart';
import 'package:convo_chat/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/register/register_screen.dart';
import '../../features/calls/calls_screen.dart';
import '../../features/groups/presentation/create_group_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/onboard/presentation/onboard_2.dart';
import '../components/components.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Onboard1Screen.routeName:
      return MaterialPageRoute(
        builder: (context) => const Onboard1Screen(),
      );

    case Onboard2Screen.routeName:
      return MaterialPageRoute(
        builder: (context) => const Onboard2Screen(),
      );

    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case RegisterScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );

    case BottomNav.routeName:
      return MaterialPageRoute(
        builder: (context) => const BottomNav(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case GroupsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const GroupsScreen(),
      );

    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateGroupScreen(),
      );

    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );

    case CallsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CallsScreen(),
      );

    // case ConfirmSoryScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmSoryScreen(
    //       file: file,
    //     ),
    //   );

    // case AddStoryScreen.routeName:
    //   final status = settings.arguments as Story;
    //   return MaterialPageRoute(
    //     builder: (context) => AddStoryScreen(
    //       status: status,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
