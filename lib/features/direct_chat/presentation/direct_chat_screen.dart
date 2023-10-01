import 'package:flutter/material.dart';

import '../../../core/utils/theme/colors.dart';
import '../../group_chat/presentation/components/group_messages_list.dart';
import 'components/custom_chat_app_bar.dart';
import 'components/message_input_bottom_bar.dart';

class DirectChatScreen extends StatefulWidget {
  final String receiverId;
  final String imgAssetUrl;
  final String username;
  final String time;
  const DirectChatScreen({
    super.key,
    required this.receiverId,
    required this.imgAssetUrl,
    required this.username,
    required this.time,
  });

  @override
  State<DirectChatScreen> createState() => _DirectChatScreenState();
}

class _DirectChatScreenState extends State<DirectChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomChatAppBar(
          imgAssetUrl: widget.imgAssetUrl,
          username: widget.username,
          time: widget.time,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ChatMessagesList(receiverId: widget.receiverId),
            GroupMessagesList(groupId: widget.receiverId),
            MessageInputBottomBar(receiverId: widget.receiverId),
          ],
        ),
      ),
    );
  }
}
