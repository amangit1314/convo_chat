import 'package:flutter/material.dart';

import '../../../core/utils/theme/colors.dart';
import '../../direct_chat/presentation/components/message_input_bottom_bar.dart';
import 'components/custom_group_app_bar.dart';
import 'components/group_messages_list.dart';

class GroupChattingScreen extends StatefulWidget {
  const GroupChattingScreen({
    super.key,
    required this.groupId,
    required this.imageAssetUrl,
    required this.groupName,
  });

  final String groupId;
  final String imageAssetUrl;
  final String groupName;

  @override
  State<GroupChattingScreen> createState() => _GroupChattingScreenState();
}

class _GroupChattingScreenState extends State<GroupChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomGroupAppBar(
          imageAssetUrl: widget.imageAssetUrl,
          groupName: widget.groupName,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GroupMessagesList(groupId: widget.groupId),
            MessageInputBottomBar(receiverId: widget.groupId),
          ],
        ),
      ),
    );
  }
}
