import 'package:flutter/material.dart';

import 'components/body.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  final String email;
  final String userName;
  const Profile({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ProfileBody(
        email: email,
        userName: userName,
      ),
    );
  }
}
