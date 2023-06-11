import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profileScreen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
