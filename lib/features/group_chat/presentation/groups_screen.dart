import 'package:convo_chat/features/group_chat/presentation/components/group_conversation_list_view.dart';

import 'package:flutter/material.dart';

import 'create_group_screen.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups';
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            'Groups',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
                size: 24,
              ),
            ),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CreateGroupScreen(
                    imageAssetUrl: 'assets/images/1.jpg',
                  ),
                ),
              )
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GroupConversationsListView(),
          ],
        ),
      ),
    );
  }
}
