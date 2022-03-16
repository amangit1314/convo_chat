import 'package:convo_chat/components/status_item.dart';
import 'package:flutter/material.dart';

class ScroolView extends StatelessWidget {
  const ScroolView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          children: const [
            // AddStatusItem(),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/13.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/2.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/3.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/4.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/5.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/6.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/7.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/8.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/9.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/10.jpg')),
            StatusItem(
                text: "Add New", avatarImg: AssetImage('assets/images/11.jpg')),
          ],
        ),
      ),
    );
  }
}
