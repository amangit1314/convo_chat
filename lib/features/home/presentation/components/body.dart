import 'package:convo_chat/features/home/presentation/components/stories_view.dart';
import 'package:flutter/material.dart';

import 'conversations_list_view.dart';

class Body extends StatelessWidget {
  // final VoidCallback? onTap;, this.onTap
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      // child: LayoutBuilder(
      //   builder: (context, constraints) =>
      child: SingleChildScrollView(
        // child: ConstrainedBox(
        //   constraints: const BoxConstraints(maxHeight: double.infinity),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
    // ),
    // );
  }
}
