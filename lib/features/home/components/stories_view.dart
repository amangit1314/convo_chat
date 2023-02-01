import 'package:convo_chat/core/components/story_item.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class StoriesView extends StatelessWidget {
//ConsumerWidget {
  const StoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //, WidgetRef ref) {
    //return
    // FutureBuilder<List<Story>>(
    //   future: ref.read(storyControllerProvider).getstory(context),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircleAvatar(
    //         backgroundColor: Colors.white,
    //         radius: 30,
    //       );
    //     }
    return SizedBox(
      height: 115,
      width: double.infinity,
      child: ListView.builder(
        itemCount: storiesDummyData.length,
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          //var storyData = snapshot.data![index];
          return StoryItem(
            //text: storyData.userName,
            text: storiesDummyData[index][1],
            //avatarImg: AssetImage(storyData.storyItemUrl[index]),
            avatarImg: AssetImage(storiesDummyData[index][0]),
          );
        },
      ),
      //);s
      //},
    );
  }
}
