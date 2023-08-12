import 'package:convo_chat/features/stories/presentation/widgets/stories_view.dart';
import 'package:flutter/material.dart';

import 'conversations_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Stories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            StoriesView(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            ConversationsListView(),
          ],
        ),
      ),
    );
  }
}
